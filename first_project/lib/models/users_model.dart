// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.code,
    this.message,
    this.content,
  });

  final String code;
  final dynamic message;
  final Content content;

  factory User.fromJson(Map<String, dynamic> json) => User(
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
    this.fullName,
    this.address,
    this.role,
    this.createdAt,
    this.isDelete,
  });

  final String id;
  final String fullName;
  final String address;
  final int role;
  final DateTime createdAt;
  final bool isDelete;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        id: json["Id"],
        fullName: json["FullName"],
        address: json["Address"],
        role: json["Role"],
        createdAt: DateTime.parse(json["CreatedAt"]),
        isDelete: json["IsDelete"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "FullName": fullName,
        "Address": address,
        "Role": role,
        "CreatedAt": createdAt.toIso8601String(),
        "IsDelete": isDelete,
      };
}
