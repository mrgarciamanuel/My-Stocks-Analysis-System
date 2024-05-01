import 'package:flutter/material.dart';
import 'package:my_stock_analsys/controllers/general.dart';

class PlotPage extends StatefulWidget {
  const PlotPage({super.key});

  @override
  State<PlotPage> createState() => _PlotPageState();
}

class _PlotPageState extends State<PlotPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context, "Plot Page", true),
        body: Container(
          child: const Text("Plot Page"),
        ));
  }
}
