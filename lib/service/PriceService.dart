
import 'HTTPRequest.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart';

abstract class PriceService implements HTTPRequest<double> {
  final String url;

  const PriceService({required this.url});

  Future<double> execute() async {
    Uri uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode != 200) {
      throw http.ClientException("Oh darn!");
    }
    return parseHtml(response.body);
  }

  double parseHtml(String html);
}

class GoldPriceService extends PriceService {
  GoldPriceService() : super(url : "https://harga-emas.org/1-gram/");

  @override
  double parseHtml(String html) {
    Document document = Document.html(html);
    String price = document
        .querySelector("tbody")!
        .children[4]
        .children[1]
        .innerHtml
        .split("&nbsp;")
        .first
        .replaceAll(".", "")
        .replaceAll(",", ".");
    return double.parse(price);
  }

}

class SilverPriceService extends PriceService {
  SilverPriceService() : super(url : "https://harga-emas.org/perak/");

  @override
  double parseHtml(String html) {
    Document document = Document.html(html);
    String price = document
        .querySelector("tbody")!
        .children[6]
        .children[1]
        .innerHtml
        .split("&nbsp;")
        .first
        .replaceAll(".", "")
        .replaceAll(",", ".");
    return double.parse(price);
  }

}
