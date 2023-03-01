// ignore: file_names


import '../../config/DioClicent.dart';
import '../Result.dart';
import 'regiReq.dart';


class regiAPI {
  //普通用户注册
  static Future<Result> userRegi({RegiReq? params}) async {
    var response = await DioClient().post(
      '/uCommonuser/regi',
      data: params?.toJson(),
    );
    // print(Result.fromJson(response).toJson());
    return Result.fromJson(response);
}

}
