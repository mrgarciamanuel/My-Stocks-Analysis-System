import 'package:flutter/material.dart';

class LinePlot extends CustomPainter {
  final customPaint = Paint()
    ..color = const Color.fromARGB(255, 0, 0, 0)
    ..strokeWidth = 2
    ..style = PaintingStyle.stroke;

  ///designs the y axis
  ///canvas: is the object we are going to draw
  ///size: is the size of the area where we are going to draw
  ///the function return an int value in where will start building the markers of this axis
  List<int> drawYAxis(Canvas canvas, Size size) {
    double x1 = 20;
    double x2 = 20;
    double y1 = 20;
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
  ///the function return an int value in where will start building the markers of this axis
  List<int> drawXAxis(Canvas canvas, Size size) {
    //par de valores para x e y
    const double x1 = 10;
    double x2 = size.width - 20;
    double y1 = size.height - 20;
    double y2 = size.height - 20;

    final p1 = Offset(x1, y1);
    final p2 = Offset(x2, y2);

    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    canvas.drawLine(p1, p2, paint);
    return [x1.toInt() + 10, y1.toInt()];
  }

  void drawXMarkers(Canvas canvas, Size size, double startX, double startY) {
    double separator = 45;
    double x = startX;

    for (int i = 0; i < 7; i++) {
      final p1 = Offset(x + separator, size.height - 10);
      final p2 = Offset(x + separator, size.height - 30);
      canvas.drawLine(p1, p2, customPaint);
      separator += 45;
    }
  }

  void drawYMarkers(Canvas canvas, Size size, double startX, double startY) {
    double separator = 45;
    double x = startX;
    double y = size.height - 20;
    for (int i = 0; i < 7; i++) {
      final p1 = Offset(x, y - separator);
      final p2 = Offset(x + 20, y - separator);
      canvas.drawLine(p1, p2, customPaint);
      separator += 45;
    }
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
    int startYaxiX = drawYAxis(canvas, size)[1];

    int startXaxiY = drawYAxis(canvas, size)[0];
    int startYaxiY = drawYAxis(canvas, size)[1];
    drawXMarkers(canvas, size, startXaxiX.toDouble(), startYaxiX.toDouble());
    drawYMarkers(canvas, size, startXaxiY.toDouble(), startYaxiY.toDouble());
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
