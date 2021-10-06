import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:first_project/utils/api_base.dart';

class RegisterRepository {
  register(
      String username, String password, String fullName, String address) async {
    var uri = Uri.parse(url + 'api/register');
    Map<String, dynamic> body = {
      "username": username,
      "password": password,
      "fullName": fullName,
      "address": address
    };
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
