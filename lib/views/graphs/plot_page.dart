import 'package:feup_plotter/feup_plotter.dart';
import 'package:flutter/material.dart';
import 'package:my_stock_analsys/controllers/general.dart';
import 'package:my_stock_analsys/globals/constants_and_variables.dart';
import 'package:my_stock_analsys/models/company.dart';
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
  List<String> symbols = [];
  List<List<int>> result = [];
  late Future<List<int>> yValues;

  @override
  void initState() {
    super.initState();
    //COMMENT THIS LINE TO USE THE API IF YOU HAVE EFFECTIVE API KEY
    result = [
      [193, 192, 190, 190, 190, 188, 187],
      [160, 177, 177, 190, 173, 172, 170]
    ];
    myCompanies = widget.myCompanies!;
    for (var company in myCompanies) {
      symbols.add(company.simbol);
    }
    //UNCOMMENT THIS LINE TO USE THE API IF YOU HAVE EFFECTIVE API KEY
    //getCompaniesInfo(symbols);
    List<int> yValues = returnPosibleValues(result);
  }

  //UNCOMMENT THIS FUNCTION TO USE THE API IF YOU HAVE EFFECTIVE API KEY
  /*getCompaniesInfo(var symbol) async {
    var resultado = await getCompaniesData(symbol);
    yValues = returnPosibleValues(resultado);
    selectedPlot =
        LinePlot(myCompanies, labels, yValues as List<int>, resultado);
    plots = {
      "line": LinePlot(myCompanies, labels, yValues as List<int>, resultado),
      "histogram":
          LinePlot(myCompanies, labels, yValues as List<int>, resultado),
      "area": AreaPlot(myCompanies, labels, yValues as List<int>, resultado),
      "stacked": LinePlot(myCompanies, labels, yValues as List<int>, resultado),
    };
  }*/

  @override
  Widget build(BuildContext context) {
    return FeupPlotter(
        names: const ["Garcia", "Manuel"],
        colors: const [Colors.black, Colors.red],
        result: result,
        labels: labels);
  }
}
