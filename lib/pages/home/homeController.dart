import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../config/LocalStorge.dart';

class HomeController extends GetxController {
  PersistentTabController tabController =
      PersistentTabController(initialIndex: 0); //初始页面
  GetStorage gs = GetStorage();

  Map<String, dynamic> userInfo = {}; //用来存储用户信息
  var userInfoMap;

  static var headImgtemp = ''.obs;
  static var nickNametemp = ''.obs;
  static var vipGradetemp = ''.obs;

  //个人信息初始化，看是否登陆，没有登陆就用初始信息
  initUserInfo() {
    //?看看有没有个人信息
    userInfoMap = gs.read(LocalStorage.userInfoMap); //看看有没有信息,即有没有登陆
    if (userInfoMap == null) {
      //没有信息
      //将信息初始化
      userInfo.addAll({
        'regiDate': "",
        'vipGoal': 0,
        'vipGrade': "登陆",
        'money': '',
        'nickName': "未登陆",
        'sex': '',
        'phone': '',
        'headImg': 'http://121.40.85.197:100/imgs/headimg.png',
        'trueName': '',
        'age': '',
      });
      gs.write(LocalStorage.userInfoMap, userInfo); //!将用户信息以map的形式存入内存

    }
    headImgtemp.value = gs.read(LocalStorage.userInfoMap)["headImg"];
    nickNametemp.value = gs.read(LocalStorage.userInfoMap)["nickName"];
    vipGradetemp.value = gs.read(LocalStorage.userInfoMap)["vipGrade"];

  }
}
