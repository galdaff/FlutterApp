import 'dart:convert';
import 'package:first_project/models/product_detail.dart';
import 'package:first_project/models/products_model.dart';
import 'package:http/http.dart' as http;

import 'package:first_project/utils/api_base.dart';

class HomeRepository {
  Future<ProductModel> fetchProduct(int pageSize, int pageIndex) async {
    //api nó trả về 1 cái obj chứ k phải list, tên class là productmodel
    var uri = Uri.parse(url +
        'api/products?PageSize=' +
        pageSize.toString() +
        '&PageIndex=' +
        pageIndex.toString());

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      print("Body: " + response.body);
      return ProductModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed');
    }
  }

  Future<ProductDetail> fetchDetail(String id) async {
    var uri = Uri.parse(url + 'api/product/detail?id=' + id.toString());

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      print("Body: " + response.body);
      return ProductDetail.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed');
    }
  }
}
