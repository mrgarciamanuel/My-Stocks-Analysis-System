import 'package:flutter/material.dart';
import 'package:my_stock_analsys/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Offset offSet = Offset(width - 120, height - 80);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      home: const HomePage(),
      builder: (context, child) {
        return Stack(
          children: [
            child!,
            Positioned(
              left: offSet.dx,
              top: offSet.dy,
              child: GestureDetector(
                /*onPanUpdate: (details) => StepState(() =>
                    _offSet += Offset(details.delta.dx, details.delta.dy)),*/
                child: FloatingActionButton(
                  onPressed: () {
                    debugPrint("Menu");
                  },
                  child: const Icon(Icons.auto_graph),
                  backgroundColor: Colors.green,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
