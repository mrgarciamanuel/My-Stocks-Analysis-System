import 'package:flutter/material.dart';
import 'package:my_stock_analsys/controllers/general.dart';
import 'package:my_stock_analsys/globals/constants_and_variables.dart';
import 'package:my_stock_analsys/models/company.dart';
import 'package:my_stock_analsys/views/graphs/line_plot.dart';

class PlotPage extends StatefulWidget {
  //this list brings the selected companies from the home page
  final List<Company>? companies;
  const PlotPage({super.key, this.companies});

  @override
  State<PlotPage> createState() => _PlotPageState();
}

class _PlotPageState extends State<PlotPage> {
  String defaultDropdownValue = "line";
  //var plots = Map<String, CustomPainter>();
  CustomPainter? selectedPlot = LinePlot();
  Map<String, CustomPainter> plots = {
    "line": LinePlot(),
    "bar": LinePlot(),
    "pie": LinePlot()
  };

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: buildAppBar(context, "Plot Page", true),
        body: SizedBox(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton(
                      items: items,
                      value: defaultDropdownValue,
                      onChanged: (String? value) {
                        setState(() {
                          defaultDropdownValue = value!;
                          selectedPlot = plots[value];
                        });
                      }),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              //this can be replaced wiht widget that will display the graph
              SizedBox(
                child: CustomPaint(
                  size: Size(width - 10, width - 10),
                  painter: selectedPlot,
                ),
              )
            ],
          ),
        ));
  }
}
