// To parse this JSON data, do
//
//     final userInfoManage = userInfoManageFromJson(jsonString);

import 'dart:convert';

UserInfoManage? userInfoManageFromJson(String str) =>
    UserInfoManage.fromJson(json.decode(str));

String userInfoManageToJson(UserInfoManage? data) =>
    json.encode(data!.toJson());

class UserInfoManage {
  UserInfoManage({
    this.email,
    this.nickName,
    this.sex,
    this.phone,
    this.headImg,
    this.trueName,
    this.age,
  });

  String? email;
  String? nickName;
  String? sex;
  String? phone;
  String? headImg;
  String? trueName;
  int? age;

  factory UserInfoManage.fromJson(Map<String, dynamic> json) => UserInfoManage(
        email: json["email"],
        nickName: json["nickName"],
        sex: json["sex"],
        phone: json["phone"],
        headImg: json["headImg"],
        trueName: json["trueName"],
        age: json["age"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "nickName": nickName,
        "sex": sex,
        "phone": phone,
        "headImg": headImg,
        "trueName": trueName,
        "age": age,
      };
}
