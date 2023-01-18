// To parse this JSON data, do
//
//     final loginReq = loginReqFromJson(jsonString);

import 'dart:convert';

LoginReq? loginReqFromJson(String str) => LoginReq.fromJson(json.decode(str));

String loginReqToJson(LoginReq? data) => json.encode(data!.toJson());

class LoginReq {
  LoginReq({
    this.email,
    this.pwd,
  });

  String? email;
  String? pwd;

  factory LoginReq.fromJson(Map<String, dynamic> json) => LoginReq(
        email: json["email"],
        pwd: json["pwd"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "pwd": pwd,
      };
}
