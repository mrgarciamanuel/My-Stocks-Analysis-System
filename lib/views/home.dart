import 'package:flutter/material.dart';
import 'package:my_stock_analsys/controllers/companyController.dart';
import 'package:my_stock_analsys/models/company.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Company>> futureCompanies;

  @override
  void initState() {
    super.initState();
    futureCompanies = getCompanies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Companies'),
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
      ),
      body: Container(
          margin: const EdgeInsets.all(10),
          child: RefreshIndicator(
            onRefresh: () {
              return Future.delayed(
                const Duration(seconds: 1),
                () {
                  setState(() {
                    futureCompanies = getCompanies();
                  });
                },
              );
            },
            child: const Text("OK"),
            /*child: FutureBuilder<List<Company>>(
            future: futureCompanies,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SizedBox(
                  child: Text("OK"),
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const SizedBox(
                  height: 5,
                  child: Center(
                    child: LinearProgressIndicator(),
                  ),
                );
              } else {
                return const Text('Error');
              }
            },
          ),*/
          )),
    );
  }
}
