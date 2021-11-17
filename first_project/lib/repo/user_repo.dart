import 'dart:convert';
import 'dart:developer';

import 'package:first_project/models/users_model.dart';
import 'package:first_project/utils/api_base.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  Future<User> fetchUser(String id) async {
    var uri = Uri.parse(url + 'api/account/detail?id=' + id);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      print("Body: " + response.body);
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed');
    }
  }
}
