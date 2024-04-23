import 'package:my_stock_analsys/models/company.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Company>> getCompanies() async {
  String url = "https://api/teste";

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body)["data"];
    return jsonResponse.map((company) => Company.fromJson(company)).toList();
  } else {
    throw Exception('Failed to load companies');
  }
}
