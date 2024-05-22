import 'package:flutter/material.dart';
import 'package:my_stock_analsys/models/company.dart';

class AreaPlot extends CustomPainter {
  final List<Company> companies = [];
  final List<String> labels = [];
  final List<int> yValues = [];
  List<List<int>> prices = [];

  AreaPlot(List<Company> selectedCompanies, List<String> labels,
      List<int> yValues, List<List<int>> prices) {
    for (var company in selectedCompanies) {
      if (company.value == true) {
        companies.add(company);
      }
    }

    this.labels.addAll(labels);
    this.yValues.addAll(yValues);
    this.prices = prices;
  }

  int nElements = 7;
  List<List<Offset>> xPoints = [];
  List<List<Offset>> yPoints = [];
  /*List<String> labels = [
    '01/05',
    '02/05',
    '03/05',
    '04/05',
    '05/05',
    '06/05',
    '07/05'
  ];*/
  // Available y values that a company can have
  //List<int> yValues = [1, 2, 3, 4, 5, 6, 7];

  // Company prices over the given days (for demonstration purposes)
  /*List<List<int>> prices = [
    [4, 1, 3, 1, 7, 6, 1],
    [7, 3, 2, 3, 6, 2, 4]
  ];*/

  Paint getCustomPaint(Color color, double strokeWidth, PaintingStyle style) {
    final customPaint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = style;
    return customPaint;
  }

  List<int> drawYAxis(Canvas canvas, Size size) {
    double x1 = 30;
    double x2 = 30;
    double y1 = 10;
    double y2 = size.height - 10;

    final p1 = Offset(x1, y1);
    final p2 = Offset(x2, y2);

    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    canvas.drawLine(p1, p2, paint);
    return [x1.toInt() - 10, x2.toInt() - 10];
  }

  List<int> drawXAxis(Canvas canvas, Size size) {
    const double x1 = 10;
    double x2 = size.width - 10;
    double y1 = size.height - 30;
    double y2 = size.height - 30;

    final p1 = Offset(x1, y1);
    final p2 = Offset(x2, y2);

    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    canvas.drawLine(p1, p2, paint);
    return [x1.toInt() + 10, y1.toInt(), x1.toInt()];
  }

  void drawInitailPoint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color.fromARGB(255, 0, 0, 0)
      ..strokeWidth = 3
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(30, size.width - 30), 2, paint);
  }

  void drawXMarkers(Canvas canvas, Size size, double startX) {
    yPoints = [];
    xPoints = [];
    double separator = 45;
    double x = startX;

    for (int i = 0; i < yValues.length; i++) {
      final p1 = Offset(x + separator, size.height - 25);
      final p2 = Offset(x + separator, size.height - 35);
      final p3 = Offset(x + separator, size.height - 30);

      if (i < labels.length) {
        canvas.drawLine(
            p1, p2, getCustomPaint(Colors.black, 1, PaintingStyle.stroke));
      }

      xPoints.add([p1, p2, p3]);
      separator += 45;
    }
  }

  void drawYMarkers(Canvas canvas, Size size, double startX) {
    int valFromYaxys = 30 + 10 + 10;
    int separator = ((size.height - valFromYaxys) / (yValues.length)).ceil();
    int helper = separator;
    double x = startX;
    double y = size.height - 20;
    for (int i = 0; i < yValues.length; i++) {
      final p1 = Offset(x, y - separator);
      final p2 = Offset(x + size.width - 30, y - separator);
      final p3 = Offset(x + 10, y - separator);
      canvas.drawLine(
          p1, p2, getCustomPaint(Colors.grey, 1, PaintingStyle.stroke));
      yPoints.add([p1, p2, p3]);
      separator += helper;
    }
  }

  void drawArea(
      Canvas canvas,
      Size size,
      List<List<int>> values,
      List<List<Offset>> xPoints,
      List<List<Offset>> yPoints,
      List<int> yValues) {
    Path path = Path();

    for (int j = 0; j < companies.length; j++) {
      path.reset();
      path.moveTo(30, size.height - 30);

      for (int i = 0; i < prices[j].length; i++) {
        var value = prices[j][i];
        var pos = yValues.indexOf(value);
        path.lineTo(xPoints[i][2].dx, yPoints[pos][2].dy);
      }

      path.lineTo(xPoints.last[2].dx, size.height - 30);
      path.close();

      final paint = Paint()
        ..color = companies[j].color.withOpacity(0.4)
        ..style = PaintingStyle.fill;

      canvas.drawPath(path, paint);
    }
  }

  void setText(
      String text, Canvas canvas, Size size, Offset location, String axis) {
    const textStyle = TextStyle(
      color: Colors.black,
      fontSize: 12,
    );

    var textSpan = TextSpan(
      text: text,
      style: textStyle,
    );

    var textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );

    textPainter.paint(
      canvas,
      Offset(axis == "x" ? location.dx - 10 : location.dx - 10,
          axis == "x" ? location.dy : location.dy - 10),
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color.fromARGB(255, 58, 58, 58).withOpacity(.8)
      ..style = PaintingStyle.stroke;

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rect, paint);
    int startXaxiX = drawXAxis(canvas, size)[0];
    int startXaxiY = drawYAxis(canvas, size)[0];

    drawXMarkers(canvas, size, startXaxiX.toDouble());
    drawYMarkers(canvas, size, startXaxiY.toDouble());

    for (int i = 0; i < xPoints.length; i++) {
      setText(yValues[i].toString(), canvas, size, yPoints[i][0], "y");
    }

    //aqui escrevo os labels no eixo x
    for (int i = 0; i < labels.length; i++) {
      setText(labels[i], canvas, size, xPoints[i][0], "x");
    }

    drawArea(canvas, size, prices, xPoints, yPoints, yValues);
    drawInitailPoint(canvas, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
