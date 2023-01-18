// To parse this JSON data, do
//
//     final result = resultFromJson(jsonString);

import 'dart:convert';

Result? resultFromJson(String str) => Result.fromJson(json.decode(str));

String resultToJson(Result? data) => json.encode(data!.toJson());

class Result {
  Result({
    this.code,
    this.msg,
    this.data,
    this.map,
  });

  int? code;
  String? msg;
  dynamic data;
  dynamic map;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        code: json["code"],
        msg: json["msg"],
        data: json["data"],
        map: json["map"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "msg": msg,
        "data": data,
        "map": map,
      };
}


