import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List<List>> getCompaniesData(List<String> simbols) async {
  var apiKey = "Y1HQQROJUQ0Y8V26";
  var baseUrl = "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY";
  List<List<int>> values = [];
  int cont = 0;
  for (String simble in simbols) {
    List<int> values1 = [];
    var finalUrl = baseUrl + "&symbol=" + simble + "&apikey=" + apiKey;
    final response = await http.get(Uri.parse(finalUrl));
    List data =
        json.decode(response.body)["Time Series (Daily)"].values.toList();

    //get only first 7 days values for each company
    for (int i = 0; i < 7; i++) {
      values1.add(double.parse((data[i]["4. close"])).ceil());
    }
    values.add(values1);
    cont++;
  }

  if (values.isNotEmpty) {
    return [values];
  } else {
    throw Exception('Failed to load companies');
  }
}
