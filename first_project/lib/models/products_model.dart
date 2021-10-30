// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    this.code,
    this.message,
    this.content,
  });

  final String code;
  final dynamic message;
  final Content content;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
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
    this.totalRecord,
    this.pageSize,
    this.pageIndex,
    this.items,
  });

  final int totalRecord;
  final int pageSize;
  final int pageIndex;
  final List<Item> items;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        totalRecord: json["TotalRecord"],
        pageSize: json["PageSize"],
        pageIndex: json["PageIndex"],
        items: List<Item>.from(json["Items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "TotalRecord": totalRecord,
        "PageSize": pageSize,
        "PageIndex": pageIndex,
        "Items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    this.id,
    this.name,
    this.manufacturer,
    this.size,
    this.category,
    this.description,
    this.quantity,
    this.status,
    this.price,
  });

  final String id;
  final String name;
  final Manufacturer manufacturer;
  final int size;
  final String category;
  final Description description;
  final int quantity;
  final int status;
  final int price;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["Id"],
        name: json["Name"],
        manufacturer: manufacturerValues.map[json["Manufacturer"]],
        size: json["Size"],
        category: json["Category"],
        description: descriptionValues.map[json["Description"]],
        quantity: json["Quantity"],
        status: json["Status"],
        price: json["Price"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
        "Manufacturer": manufacturerValues.reverse[manufacturer],
        "Size": size,
        "Category": category,
        "Description": descriptionValues.reverse[description],
        "Quantity": quantity,
        "Status": status,
        "Price": price,
      };
}

enum Description { ABC }

final descriptionValues = EnumValues({"abc": Description.ABC});

enum Manufacturer { MANU1, MANU2 }

final manufacturerValues =
    EnumValues({"Manu1": Manufacturer.MANU1, "Manu2": Manufacturer.MANU2});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
