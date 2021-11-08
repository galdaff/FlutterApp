// To parse this JSON data, do
//
//     final info = infoFromJson(jsonString);

import 'dart:convert';

Info infoFromJson(String str) => Info.fromJson(json.decode(str));

String infoToJson(Info data) => json.encode(data.toJson());

class Info {
  Info({
    this.code,
    this.message,
    this.content,
  });

  final String code;
  final dynamic message;
  final Content content;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
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
    this.token,
  });

  final String token;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
