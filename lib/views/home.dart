import 'package:flutter/material.dart';
import 'package:my_stock_analsys/globals/constants_and_variables.dart';
import 'package:my_stock_analsys/models/company.dart';
import 'package:my_stock_analsys/controllers/general.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text(
            'Companies',
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
          leading: IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              debugPrint("Menu");
            },
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
        ),
        body: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Expanded(
                child: RefreshIndicator(
                    onRefresh: () {
                      return Future.delayed(
                        const Duration(seconds: 1),
                        () {
                          setState(() {
                            showSnackBar(context, "Data loaded", 0);
                          });
                        },
                      );
                    },
                    child: ListView.builder(
                      itemCount: companies.length,
                      itemBuilder: (context, index) {
                        return CheckboxListTile(
                          activeColor: Colors.green,
                          checkColor: Colors.white,
                          selected: companies[index].value!,
                          value: companies[index].value,
                          onChanged: (bool? value) {
                            setState(() {
                              var cont = 0;
                              for (var company in companies) {
                                if (company.value == true) {
                                  cont++;
                                }
                              }

                              if (cont <= 1) {
                                companies[index].value = value!;
                              } else if (value == false) {
                                companies[index].value = value!;
                              } else {
                                showSnackBar(context,
                                    "You can only select two companies", 1);
                              }
                            });
                          },
                          title: Text(companies[index].name),
                          subtitle: Text(companies[index].industry),
                          /*secondary: Image.network(
                          "https://drive.google.com/file/d/1bqZTSQSi9r5m91TWSynS7Yw-FuPv0dRA/view?usp=sharing")*/
                        );
                      },
                    )),
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.bar_chart),
                onPressed: () {
                  generateGraph(context, companies);
                },
                label: const Text("Generate Graph"),
              )
            ],
          ),
        ));
  }
}
