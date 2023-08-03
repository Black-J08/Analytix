import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<dynamic>> searchAssist(String str) async {
  List<dynamic> searchList = [];

  var url = Uri.parse('https://finance.yahoo.com/_finance_doubledown/api/resource/searchassist;searchTerm=$str');
  var response = await http.get(url);
  var json = jsonDecode(response.body);

  // Filtering equity and index only
  for (var element in json['items']) {
    if (element['typeDisp'].toString() == "Equity" || element['typeDisp'].toString() == "Index") {
      searchList.add(element);
    }
  }
  return searchList;
}
