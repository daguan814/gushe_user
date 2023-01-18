// To parse this JSON data, do
//
//     final regiReq = regiReqFromJson(jsonString);

import 'dart:convert';

RegiReq? regiReqFromJson(String str) => RegiReq.fromJson(json.decode(str));

String regiReqToJson(RegiReq? data) => json.encode(data!.toJson());

class RegiReq {
  RegiReq({
    this.email,
    this.pwd,
  });

  String? email;
  String? pwd;

  factory RegiReq.fromJson(Map<String, dynamic> json) => RegiReq(
        email: json["email"],
        pwd: json["pwd"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "pwd": pwd,
      };
}
