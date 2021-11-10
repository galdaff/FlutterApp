//goi api cai da

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:first_project/utils/api_base.dart';

class LoginRepository {
  login(String username, String password) async {
    var uri = Uri.parse(url + 'api/login');
    Map<String, dynamic> body = {"username": username, "password": password};
    var headers = {
      'Content-Type': 'application/json',
    };

    final response =
        await http.post(uri, headers: headers, body: jsonEncode(body));

    var convertedDataToJson = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print("Login ok");
      return convertedDataToJson;
    } else {
      return 'failed';
    }
  }
}

// alo ? ye discord vo thu coi