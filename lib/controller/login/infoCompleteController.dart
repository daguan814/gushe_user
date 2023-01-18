import 'package:flutter_gushejianying/API/FileUpload.dart';
import 'package:flutter_gushejianying/API/Result.dart';
import 'package:flutter_gushejianying/API/userInfoManage/userInfoManage.dart';
import 'package:flutter_gushejianying/API/userInfoManage/userInfoManageAPI.dart';
import 'package:flutter_gushejianying/common/config/DioClicent.dart';
import 'package:flutter_gushejianying/common/config/LocalStorge.dart';
import 'package:flutter_gushejianying/common/routes/Routes.dart';
import 'package:flutter_gushejianying/pages/login/infoComplete.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:dio/dio.dart' as dioCC;

class infoCompleteController extends GetxController {
  late Map<String, dynamic> map; //用来存储表单信息

  infoComplete() async {
    GetStorage gs = GetStorage();
    // 1.信息放入实体类
    UserInfoManage params = UserInfoManage(
        email: gs.read(LocalStorage.email),
        nickName: map["nickName"],
        sex: map["sex"].data,
        phone: map["phone"],
        //! 2.图片上传
        headImg: await FileUpload.ImgUpload(map["headImg"]), //?先上传再获取返回值。
        trueName: map["trueName"],
        age: map["age"]);
    //3.整体信息上传
    Result result = await userInfoManageAPI.userInfoManage(params: params);
    if (result.code == 200) {
      Get.snackbar(gs.read(LocalStorage.email), "您的信息完善成功！现在可以登陆");
      Get.offAllNamed(Routes.login);
    }else{
      Get.snackbar("error!!","出现未知错误。");
    }
  }
}
