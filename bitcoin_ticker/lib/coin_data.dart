import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR',
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class Network {
  String apikey = '9E78971C-81FE-48CC-8624-DD31FF1F2FB9';
  String urlprefix = 'https://rest.coinapi.io/v1/exchangerate';

  Future<String?> getRate(String crypto, String unit) async {
    String link = '$urlprefix/$crypto/$unit?apikey=$apikey';

    Uri url = Uri.parse(link);
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var rate = jsonDecode(response.body)['rate'];
        return rate.toStringAsFixed(0);
      }
    } catch (e) {
      return null;
    }
  }
}
