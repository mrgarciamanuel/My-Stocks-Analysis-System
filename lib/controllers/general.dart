import 'package:flutter/material.dart';
import 'package:my_stock_analsys/models/company.dart';
import 'package:my_stock_analsys/views/graphs/plot_page.dart';
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

generateGraph(BuildContext context, List<Company> myCompanies) {
  List<Company> data = myCompanies;

  if (data.isNotEmpty) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PlotPage(
                  myCompanies: data,
                )));
  } else {
    showSnackBar(context, "Need to select at least one company", 1);
  }
}

AppBar buildAppBar(BuildContext context, String title, bool back) {
  return AppBar(
    backgroundColor: Colors.green,
    title: Text(
      title,
      style: const TextStyle(color: Colors.white, fontSize: 17),
    ),
    leading: !back
        ? const IconButton(
            icon: Icon(Icons.home),
            onPressed: null,
          )
        : IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
    actions: <Widget>[
      PopupMenuButton(
          itemBuilder: (content) => [
                const PopupMenuItem(
                  value: 1,
                  child: Text("About"),
                ),
              ],
          onSelected: (value) {
            if (value == 0) {
              debugPrint("About");
            }
          })
    ],
  );
}

List<String> getDaysLabel(DateTime hoje) {
  List<String> days = [];
  DateTime newDay = hoje;
  for (int i = 0; i < 20; i++) {
    if (days.length <= 7) {
      newDay = DateTime(newDay.year, newDay.month, newDay.day - 1);
      if (newDay.weekday != 0 && newDay.weekday != 7) {
        days.add(newDay.toString().substring(1, 10));
      }
    }
  }
  return days;
}
