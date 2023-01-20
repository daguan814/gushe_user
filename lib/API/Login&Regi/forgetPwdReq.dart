// To parse this JSON data, do
//
//     final forgetPwdReq = forgetPwdReqFromJson(jsonString);

import 'dart:convert';

ForgetPwdReq forgetPwdReqFromJson(String str) =>
    ForgetPwdReq.fromJson(json.decode(str));

String forgetPwdReqToJson(ForgetPwdReq data) => json.encode(data.toJson());

class ForgetPwdReq {
  ForgetPwdReq({
    required this.email,
  });

  String email;

  factory ForgetPwdReq.fromJson(Map<String, dynamic> json) => ForgetPwdReq(
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
      };
}
