
import '../../config/DioClicent.dart';
import '../Result.dart';
import 'userInfoManage.dart';


class userInfoManageAPI {
  //普通用户注册后需要补全信息
  static Future<Result> userInfoManage({UserInfoManage? params}) async {
    var response = await DioClient().put(
      '/uCommonuser/userinfoManage',
      data: params?.toJson(),
    );
    // print(Result.fromJson(response).toJson());
    return Result.fromJson(response);
  }


}
