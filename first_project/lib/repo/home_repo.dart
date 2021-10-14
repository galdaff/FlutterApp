import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:first_project/utils/api_base.dart';

class HomeRepository {
  home(String productName) async {
    var uri = Uri.parse(url + 'api/products');
    Map<String, dynamic> body = {"Name": productName};
    var headers = {
      'Content-Type': 'application/json',
    };

    final response =
        await http.post(uri, headers: headers, body: jsonEncode(body));

    var convertedDataToJson = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return convertedDataToJson;
    } else {
      return 'failed';
    }
  }
}
