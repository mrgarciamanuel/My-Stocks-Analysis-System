import 'package:flutter/material.dart';

import '../../models/company.dart';

class StackedLinePlot extends CustomPainter {
  final List<Company> companies = [];
  StackedLinePlot(List<Company> selectedCompanies) {
    companies.addAll(selectedCompanies);
  }
  int nElements = 7;
  List<List<Offset>> xPoints = [];
  List<List<Offset>> yPoints = [];
  List<String> labels = [
    '01/05',
    '02/05',
    '03/05',
    '04/05',
    '05/05',
    '06/05',
    '07/05'
  ];

  List<int> yValues = [1, 2, 3, 4, 5, 6, 7];

  // Prices for each company on each day
  List<List<int>> prices = [
    [4, 1, 3, 1, 7, 6, 1],
    [7, 3, 2, 3, 6, 2, 4]
  ];

  Paint getCustomPaint(Color color, double strokeWidth, PaintingStyle style) {
    return Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = style;
  }

  void drawAxesAndMarkers(Canvas canvas, Size size) {
    drawXAxis(canvas, size);
    drawYAxis(canvas, size);
    double startXaxiX = drawXAxis(canvas, size).first.toDouble();
    double startXaxiY = drawYAxis(canvas, size).first.toDouble();
    drawXMarkers(canvas, size, startXaxiX);
    drawYMarkers(canvas, size, startXaxiY);

    for (int i = 0; i < xPoints.length; i++) {
      setText(labels[i], canvas, size, xPoints[i][0], "x");
      setText(yValues[i].toString(), canvas, size, yPoints[i][0], "y");
    }
  }

  void drawStackedLines(Canvas canvas, Size size) {
    Map<int, Color> colors = {
      0: Colors.blue,
      1: Colors.green
    }; 
    List<int> cumulativeValues = List.filled(nElements, 0);

    for (int j = 0; j < prices.length; j++) {
      for (int i = 0; i < nElements; i++) {
        int value = prices[j][i];
        cumulativeValues[i] +=
            value; // Update cumulative value for this x position
        Offset startPoint = i == 0
            ? Offset(
                xPoints[i][2].dx, size.height - 30 - cumulativeValues[i] * 10)
            : Offset(xPoints[i - 1][2].dx,
                size.height - 30 - cumulativeValues[i - 1] * 10);
        Offset endPoint = Offset(
            xPoints[i][2].dx, size.height - 30 - cumulativeValues[i] * 10);

        // Draw line
        canvas.drawLine(startPoint, endPoint,
            getCustomPaint(colors[j]!, 2, PaintingStyle.stroke));
        // Draw point
        canvas.drawCircle(
            endPoint, 3, getCustomPaint(colors[j]!, 1, PaintingStyle.fill));
      }
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = const Color.fromARGB(255, 58, 58, 58).withOpacity(0.8)
      ..style = PaintingStyle.stroke;

    final Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rect, paint);

    drawAxesAndMarkers(canvas, size);
    drawStackedLines(canvas, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  
  ///size: is the size of the area where we are going to draw
  ///the function return an int value in where will start building the markers of this axis
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

  ///designs the x axis
  ///canvas: is the object we are going to draw
  ///size: is the size of the area where we are going to draw
  ///returns an array containing: firs two are coordinates where we'll start building the markers of this axis and the last one are real points in the x axis
  List<int> drawXAxis(Canvas canvas, Size size) {
    //par de valores para x e y
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

  
  void drawXMarkers(Canvas canvas, Size size, double startX) {

    yPoints = [];
    xPoints = [];
    double separator = 45;
    double x = startX;

    for (int i = 0; i < nElements; i++) {
      final p1 = Offset(x + separator, size.height - 25);
      final p2 = Offset(x + separator, size.height - 35);
      final p3 = Offset(x + separator, size.height - 30);
      canvas.drawLine(
          p1, p2, getCustomPaint(Colors.black, 1, PaintingStyle.stroke));
      xPoints.add([p1, p2, p3]);
      separator += 45;
    }
  }

  void drawYMarkers(Canvas canvas, Size size, double startX) {
    double separator = 45;
    double x = startX;
    double y = size.height - 20;
    for (int i = 0; i < nElements; i++) {
      final p1 = Offset(x + 5, y - separator);
      final p2 = Offset(x + size.width - 30, y - separator);
      final p3 = Offset(x + 10, y - separator);
      canvas.drawLine(
          p1, p2, getCustomPaint(Colors.grey, 1, PaintingStyle.stroke));
      yPoints.add([p1, p2, p3]);
      separator += 45;
    }
  }


  setText(String text, Canvas canvas, size, Offset location, String axis) {
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
}
