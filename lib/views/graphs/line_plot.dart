import 'package:flutter/material.dart';

class LinePlot extends CustomPainter {
  void drawYAxis(Canvas canvas, Size size) {
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
  }

  void drawXAxis(Canvas canvas, Size size) {
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
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
