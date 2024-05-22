import 'package:flutter/material.dart';
import 'package:my_stock_analsys/controllers/general.dart';
import 'package:my_stock_analsys/globals/constants_and_variables.dart';
import 'package:my_stock_analsys/models/company.dart';
import 'package:my_stock_analsys/views/graphs/area_plot.dart';
import 'package:my_stock_analsys/views/graphs/line_plot.dart';
import 'package:my_stock_analsys/controllers/apiCommunication.dart';

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
  Map<String, CustomPainter> plots = {};
  List<String> labels = getDaysLabel(DateTime.now());
  //late Future<List<List>> result;

  @override
  void initState() {
    super.initState();
    List<List<int>> result = [
      [193, 192, 190, 190, 190, 188, 187],
      [160, 177, 177, 198, 173, 171, 170]
    ];
    List<int> yValues = returnPosibleValues(result);
    myCompanies = widget.myCompanies!;
    selectedPlot = LinePlot(myCompanies, labels, yValues, result);
    plots = {
      "line": LinePlot(myCompanies, labels, yValues, result),
      "histogram": LinePlot(myCompanies, labels, yValues, result),
      "area": AreaPlot(myCompanies),
      "stacked": LinePlot(myCompanies, labels, yValues, result),
    };

    //result = getCompaniesData(["AAPL", "GOOGL"]);
  }

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
                          myCompanies = widget.myCompanies!;
                          //plots[value!] =
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
