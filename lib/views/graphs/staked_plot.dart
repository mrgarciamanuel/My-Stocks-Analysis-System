import 'package:flutter/material.dart';
import 'package:my_stock_analsys/models/company.dart';

class StackedLinePlot extends CustomPainter {
  final List<Company> companies;
  final List<String> labels;
  final List<int> yValues;
  final List<List<int>> prices;

  StackedLinePlot(this.companies, this.labels, this.yValues, this.prices);

  List<List<Offset>> xPoints = [];
  List<List<Offset>> yPoints = [];

  Paint getCustomPaint(Color color, double strokeWidth, PaintingStyle style) {
    return Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = style;
  }

  List<int> drawAxis(Canvas canvas, Size size, bool isXAxis) {
    double start = isXAxis ? 10 : 30;
    double end = isXAxis ? size.width - 10 : 30;
    double pos = isXAxis ? size.height - 30 : 10;
    Offset p1 = isXAxis ? Offset(start, pos) : Offset(start, size.height - pos);
    Offset p2 = isXAxis ? Offset(end, pos) : Offset(end, size.height - pos);

    canvas.drawLine(p1, p2, getCustomPaint(Colors.black, 1, PaintingStyle.stroke));
    return [start.toInt() + (isXAxis ? 10 : -10), pos.toInt()];
  }

  void drawMarkers(Canvas canvas, Size size, double start, bool isXAxis) {
    double increment = 45.0;
    double pos = isXAxis ? size.height - 30 : 30;

    for (int i = 0; i < (isXAxis ? labels.length : yValues.length); i++) {
      double markerPos = start + (i * increment);
      Offset p1 = isXAxis ? Offset(markerPos, pos - 5) : Offset(start - 5, size.height - markerPos);
      Offset p2 = isXAxis ? Offset(markerPos, pos + 5) : Offset(start + 5, size.height - markerPos);

      canvas.drawLine(p1, p2, getCustomPaint(Colors.black, 1, PaintingStyle.stroke));
      if (isXAxis) {
        xPoints.add([p1, p2]);
      } else {
        yPoints.add([p1, p2]);
      }
    }
  }

  List<int> cumulativeYValues(List<int> values) {
    List<int> cumulative = [];
    int sum = 0;
    for (var value in values) {
      sum += value;
      cumulative.add(sum);
    }
    return cumulative;
  }

  void drawLines(Canvas canvas, Size size) {
    List<List<int>> cumulativePrices = prices.map((priceList) => cumulativeYValues(priceList)).toList();
    for (int j = 0; j < companies.length; j++) {
      for (int i = 0; i < cumulativePrices[j].length - 1; i++) {
        Offset startPoint = Offset(xPoints[i][0].dx, size.height - (cumulativePrices[j][i] * (size.height / yValues.last)));
        Offset endPoint = Offset(xPoints[i + 1][0].dx, size.height - (cumulativePrices[j][i + 1] * (size.height / yValues.last)));
        canvas.drawLine(startPoint, endPoint, getCustomPaint(companies[j].color, 2, PaintingStyle.stroke));
      }
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), getCustomPaint(Colors.grey[300]!, 1, PaintingStyle.fill));

    int startX = drawAxis(canvas, size, true)[0];
    int startY = drawAxis(canvas, size, false)[0];

    drawMarkers(canvas, size, startX.toDouble(), true);
    drawMarkers(canvas, size, startY.toDouble(), false);

    drawLines(canvas, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
