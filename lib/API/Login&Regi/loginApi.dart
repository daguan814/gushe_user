// ignore: file_names

import 'package:flutter_gushejianying/API/Login&Regi/loginReq.dart';

import '../../../common/config/DioClicent.dart';
import '../Result.dart';
import 'regiReq.dart';

class loginApi {
  //普通用户注册
  static Future<Result> userlogin({LoginReq? params}) async {
    var response = await DioClient().post(
      '/uCommonuser/login',
      data: params?.toJson(),
    );
    // print(Result.fromJson(response).toJson());
    return Result.fromJson(response);
  }


}
