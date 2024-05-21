import 'package:flutter/material.dart';
import 'package:my_stock_analsys/controllers/general.dart';
import 'package:my_stock_analsys/globals/constants_and_variables.dart';
import 'package:my_stock_analsys/models/company.dart';
import 'package:my_stock_analsys/views/graphs/area_plot.dart';
import 'package:my_stock_analsys/views/graphs/line_plot.dart';

class PlotPage extends StatefulWidget {
  //this list brings the selected companies from the home page
  final List<Company>? myCompanies;
  const PlotPage({super.key, this.myCompanies});

  @override
  State<PlotPage> createState() => _PlotPageState();
}

class _PlotPageState extends State<PlotPage> {
  String defaultDropdownValue = "line";
  CustomPainter? selectedPlot;

  @override
  void initState() {
    super.initState();
    myCompanies = widget.myCompanies!;
    selectedPlot = LinePlot(myCompanies);
  }

  Map<String, CustomPainter> plots = {
    "line": LinePlot(myCompanies),
    "histogram": LinePlot(myCompanies),
    "area": AreaPlot(myCompanies),
    "stacked": LinePlot(myCompanies)
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
                height: 5,
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
                height: 5,
              ),
              //this can be replaced wiht widget that will display the graph
              SizedBox(
                child: CustomPaint(
                  size: Size(width - 10, width - 10),
                  painter: selectedPlot,
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(myCompanies[0].name),
                      Text("________",
                          style: TextStyle(
                              color: myCompanies[0].color, fontSize: 20))
                    ],
                  ),
                  myCompanies.length > 1
                      ? Column(
                          children: [
                            Text(myCompanies[1].name),
                            Text("________",
                                style: TextStyle(
                                    color: myCompanies[1].color, fontSize: 20))
                          ],
                        )
                      : const SizedBox()
                ],
              )
            ],
          ),
        ));
  }
}
