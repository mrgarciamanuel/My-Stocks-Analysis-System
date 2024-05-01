import 'package:flutter/material.dart';
import 'package:my_stock_analsys/models/company.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

Widget showSomethingWentWrong(
    double hight, double width, String errorMessage1, String errorMessage2) {
  var widget = Container(
    margin: const EdgeInsets.all(0),
    width: width * 0.9,
    height: hight * 0.5,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          errorMessage1,
          style: const TextStyle(fontSize: 15, color: Colors.red),
        ),
        const Icon(Icons.error, color: Colors.red, size: 100),
        Text(
          errorMessage2,
          style: const TextStyle(fontSize: 18, color: Colors.red),
        ),
      ],
    ),
  );
  return widget;
}

showSnackBar(BuildContext context, String message, int error) {
  showTopSnackBar(
    Overlay.of(context),
    error == 0
        ? CustomSnackBar.success(message: message)
        : CustomSnackBar.error(message: message),
  );
}

generateGraph(BuildContext context, List<Company> companies) {
  List data = [];
  for (var company in companies) {
    if (company.value == true) {
      data.add(company.name);
    }
  }

  if (data.isNotEmpty) {
    showSnackBar(context, data.toString(), 0);
  } else {
    showSnackBar(context, "Need to select at least one company", 1);
  }
}
