import 'package:flutter/material.dart';
import 'package:my_stock_analsys/controllers/companyController.dart';
import 'package:my_stock_analsys/models/car.dart';
import 'package:my_stock_analsys/models/company.dart';
import 'package:my_stock_analsys/controllers/general.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Car>> futureCars;
  late Future<List<Company>> futureCompanies;

  @override
  void initState() {
    super.initState();
    futureCars = getCars();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Companies',
          style: TextStyle(color: Colors.black, fontSize: 17),
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
          child: RefreshIndicator(
            onRefresh: () {
              return Future.delayed(
                const Duration(seconds: 1),
                () {
                  setState(() {
                    futureCars = getCars();
                  });
                },
              );
            },
            child: FutureBuilder<List<Car>>(
              future: futureCars,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Car> cars = snapshot.data!;
                  if (context.mounted) {
                    Future.delayed(const Duration(seconds: 0), () {
                      showSnackBar(context, "Data loaded", 1);
                    });
                  }
                  return ListView.builder(
                    itemCount: cars.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(cars[index].car),
                          subtitle: Text(cars[index].carModel),
                        ),
                      );
                    },
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const SizedBox(
                    height: 5,
                    child: Center(
                      child: LinearProgressIndicator(),
                    ),
                  );
                } else {
                  Future.delayed(const Duration(seconds: 0), () {
                    showSnackBar(context, "Something went wrong", 2);
                  });
                  return showSomethingWentWrong(
                      MediaQuery.of(context).size.height,
                      MediaQuery.of(context).size.width,
                      "Unble to load data",
                      "Please try again later");
                }
              },
            ),
          )),
    );
  }
}
