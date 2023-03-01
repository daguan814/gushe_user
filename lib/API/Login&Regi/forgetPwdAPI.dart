




import 'package:flutter_gushejianying/API/Login&Regi/forgetPwdReq.dart';

import '../../config/DioClicent.dart';
import '../Result.dart';

class ForgetPwdApi {
  //忘记密码
  static Future<Result> forgetPwdApi({ForgetPwdReq? params}) async {
    var response = await DioClient().put(
      '/uCommonuser/forgetPwd',
      data: params?.toJson(),
    );
    // print(Result.fromJson(response).toJson());
    return Result.fromJson(response);
  }
}
