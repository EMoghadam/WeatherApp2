import 'package:http/http.dart' as http;
import 'dart:convert';

class Networking {
  Networking(this.url);

  final String url;

  Future<dynamic> getdata() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
