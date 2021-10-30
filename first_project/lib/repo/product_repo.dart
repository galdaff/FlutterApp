import 'dart:convert';

import 'package:first_project/utils/api_base.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  addProduct(String name, String manufacturer, int size, String category,
      String description, int quantity, int status, int price) async {
    var uri = Uri.parse(url + 'api/product');
    Map<String, dynamic> body = {
      "name": name,
      "manufacturer": manufacturer,
      "size": size,
      "category": category,
      "description": description,
      "quantity": quantity,
      "status": status,
      "price": price
    };
    var header = {
      'Content-Type': 'application/json',
    };
    final response =
        await http.post(uri, headers: header, body: jsonEncode(body));
    var convertDataToJson = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return convertDataToJson;
    } else {
      return 'failed';
    }
  }
}
