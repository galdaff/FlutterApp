// To parse this JSON data, do
//
//     final productDetail = productDetailFromJson(jsonString);

import 'dart:convert';

ProductDetail productDetailFromJson(String str) =>
    ProductDetail.fromJson(json.decode(str));

String productDetailToJson(ProductDetail data) => json.encode(data.toJson());

class ProductDetail {
  ProductDetail({
    this.code,
    this.message,
    this.content,
  });

  final String code;
  final dynamic message;
  final Content content;

  factory ProductDetail.fromJson(Map<String, dynamic> json) => ProductDetail(
        code: json["Code"],
        message: json["Message"],
        content: Content.fromJson(json["Content"]),
      );

  Map<String, dynamic> toJson() => {
        "Code": code,
        "Message": message,
        "Content": content.toJson(),
      };
}

class Content {
  Content({
    this.id,
    this.name,
    this.manufacturer,
    this.size,
    this.category,
    this.description,
    this.quantity,
    this.price,
    this.status,
    this.orderDetails,
    this.createdAt,
    this.isDelete,
  });

  final String id;
  final String name;
  final String manufacturer;
  final int size;
  final String category;
  final String description;
  final int quantity;
  final int price;
  final int status;
  final dynamic orderDetails;
  final DateTime createdAt;
  final bool isDelete;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        id: json["Id"],
        name: json["Name"],
        manufacturer: json["Manufacturer"],
        size: json["Size"],
        category: json["Category"],
        description: json["Description"],
        quantity: json["Quantity"],
        price: json["Price"],
        status: json["Status"],
        orderDetails: json["OrderDetails"],
        createdAt: DateTime.parse(json["CreatedAt"]),
        isDelete: json["IsDelete"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
        "Manufacturer": manufacturer,
        "Size": size,
        "Category": category,
        "Description": description,
        "Quantity": quantity,
        "Price": price,
        "Status": status,
        "OrderDetails": orderDetails,
        "CreatedAt": createdAt.toIso8601String(),
        "IsDelete": isDelete,
      };
}
