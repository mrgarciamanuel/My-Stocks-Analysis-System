import 'package:flutter/material.dart';
import 'package:my_stock_analsys/models/company.dart';

class AreaPlot extends CustomPainter {
 final List<Company> companies = [];
  AreaPlot(List<Company> selectedCompanies) {
    companies.addAll(selectedCompanies);
  }
  
  @override
  void paint(Canvas canvas, Size size) {
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
