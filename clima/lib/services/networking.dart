import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class NetworkHelper {
  final String hiperlink;

  NetworkHelper(this.hiperlink);

  Future getHTTPData() async {
    http.Response response = await http.get(Uri.parse(hiperlink));
    if (response.statusCode == 200) {
      String data = response.body;
      return convert.jsonDecode(data);
    } else {
      // print(response.statusCode);
    }
  }
}
