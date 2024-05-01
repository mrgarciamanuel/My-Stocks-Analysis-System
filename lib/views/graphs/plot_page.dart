import 'package:flutter/material.dart';
import 'package:my_stock_analsys/controllers/general.dart';

class PlotPage extends StatefulWidget {
  const PlotPage({super.key});

  @override
  State<PlotPage> createState() => _PlotPageState();
}

class _PlotPageState extends State<PlotPage> {
  String defaultDropdownValue = "line";
  var items = [
    const DropdownMenuItem(
      value: "line",
      child: Text("Line Graph"),
    ),
    const DropdownMenuItem(
      value: "histogram",
      child: Text("Histogram Graph"),
    ),
    const DropdownMenuItem(
      value: "area",
      child: Text("Area Graph"),
    ),
    const DropdownMenuItem(
      value: "stacked",
      child: Text("Stacked Graph"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context, "Plot Page", true),
        body: SizedBox(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DropdownButton(
                      items: items,
                      value: defaultDropdownValue,
                      onChanged: (String? value) {
                        setState(() {
                          defaultDropdownValue = value!;
                        });
                      }),
                  ElevatedButton(
                      onPressed: () {
                        showSnackBar(context, "You shoosed", 0);
                      },
                      child: const Text("Generate Graph"))
                ],
              ),
              //this can be replaced wiht widget that will display the graph
              Container(
                margin: const EdgeInsets.all(10),
                child: const Text("Graph will be displayed here",
                    style: TextStyle(fontSize: 20)),
              )
            ],
          ),
        ));
  }
}
