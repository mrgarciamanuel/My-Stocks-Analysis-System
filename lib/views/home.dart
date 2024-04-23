import 'package:flutter/material.dart';
import 'package:my_stock_analsys/models/company.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        child: RefreshIndicator(
          onRefresh: () {
            debugPrint('Refreshed');
          },
          child: FutureBuilder<List<Company>>(
              //future: ,
              ),
        ));
  }
}
