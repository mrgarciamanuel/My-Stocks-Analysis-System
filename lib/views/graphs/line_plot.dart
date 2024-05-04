import 'package:flutter/material.dart';

class LinePlot extends CustomPainter {
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
  final customPaint = Paint()
    ..color = const Color.fromARGB(255, 0, 0, 0)
    ..strokeWidth = 2
    ..style = PaintingStyle.stroke;

  ///designs the y axis
  ///canvas: is the object we are going to draw
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

  ///desenha marcadores no eixo X
  void drawXMarkers(Canvas canvas, Size size, double startX) {
    double separator = 45;
    double x = startX;

    for (int i = 0; i < nElements; i++) {
      final p1 = Offset(x + separator, size.height - 25);
      final p2 = Offset(x + separator, size.height - 35);
      final p3 = Offset(x + separator, size.height - 30);
      canvas.drawLine(p1, p2, customPaint);
      xPoints.add([p1, p2, p3]);
      separator += 45;
    }
  }

  ///desenha marcadores no eixo Y
  void drawYMarkers(Canvas canvas, Size size, double startX) {
    double separator = 45;
    double x = startX;
    double y = size.height - 20;
    for (int i = 0; i < nElements; i++) {
      final p1 = Offset(x + 5, y - separator);
      final p2 = Offset(x + 15, y - separator);
      final p3 = Offset(x + 10, y - separator);
      canvas.drawLine(p1, p2, customPaint);
      yPoints.add([p1, p2, p3]);
      separator += 45;
    }
  }

  ///vai desenhar o ponto de encontro entre os eixos x e y
  void drawPoint(Canvas canvas, Offset point) {
    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 3
      ..style = PaintingStyle.fill;
    canvas.drawCircle(point, 3, paint);
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

    debugPrint(location.toString());

    textPainter.paint(
      canvas,
      Offset(axis == "x" ? location.dx - 10 : location.dx - 10,
          axis == "x" ? location.dy : location.dy - 10),
    );
  }

  ///size: é o tamanho da area onde vamos desenhar
  ///canvas: é o objeto que vamos desenhar
  ///paint: é o objeto que contém as propriedades do que desejamos desenhar: cor, espessura da linha, etc
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color.fromARGB(255, 58, 58, 58).withOpacity(.8)
      ..style = PaintingStyle.stroke;

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(
      rect,
      paint,
    );
    drawXAxis(canvas, size);
    drawYAxis(canvas, size);
    int startXaxiX = drawXAxis(canvas, size)[0];
    int startXaxiY = drawYAxis(canvas, size)[0];

    drawXMarkers(canvas, size, startXaxiX.toDouble());
    drawYMarkers(canvas, size, startXaxiY.toDouble());

    for (int i = 0; i < xPoints.length; i++) {
      drawPoint(canvas, xPoints[i][2]);
      drawPoint(canvas, yPoints[i][2]);
      setText(yValues[i].toString(), canvas, size, yPoints[i][0], "y");
      setText(labels[i], canvas, size, xPoints[i][0], "x");
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
