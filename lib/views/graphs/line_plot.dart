import 'package:flutter/material.dart';

class LinePlot extends CustomPainter {
  final painter = Paint()
    ..color = Colors.blue
    ..strokeWidth = 4;

  void drawAxis() {}

  @override
  void paint(Canvas canvas, Size size) {
    //paint contém todas informações das propriedade do desenho
    final paint = Paint()
      ..color = Colors.purple.withOpacity(.8)
      ..style = PaintingStyle.stroke;

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(
      rect,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
