import 'package:flutter/material.dart';
import 'package:my_stock_analsys/controllers/general.dart';
import 'package:my_stock_analsys/globals/constants_and_variables.dart';
import 'package:my_stock_analsys/models/company.dart';

class PlotPage extends StatefulWidget {
  //this list brings the selected companies from the home page
  final List<Company>? companies;
  const PlotPage({super.key, this.companies});

  @override
  State<PlotPage> createState() => _PlotPageState();
}

class _PlotPageState extends State<PlotPage> {
  String defaultDropdownValue = "line";
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
                      //trigger the graph generation
                      onPressed: () {
                        showSnackBar(context,
                            "You choosed: $defaultDropdownValue to plot", 0);
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
