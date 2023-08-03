import 'package:html/dom.dart' as dom;
import 'package:http/http.dart' as http;

Future<List> getCurrentPrice(String symbol) async {
  List price = [];
  var url = Uri.parse("https://finance.yahoo.com/quote/$symbol?p=$symbol");
  var response = await http.get(url);
  var document = dom.Document.html(response.body);
  var priceNow = document.querySelector("#quote-header-info > div > div > div > fin-streamer");
  var dayChange = document.querySelectorAll('#quote-header-info > div > div > div > fin-streamer > span');
  price.add(double.parse(priceNow!.innerHtml.toString()));
  price.add(double.parse(dayChange[0].innerHtml.toString()));
  price.add(dayChange[1].innerHtml.toString());
  return price;
}
