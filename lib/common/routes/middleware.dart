import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../config/LocalStorge.dart';
import 'Routes.dart';

//判断用户登陆中间件
class RouteAuthMiddleware extends GetMiddleware {
  // @override
  // int priority = 0;

  // RouteAuthMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    //没有登陆，去登陆页，这里应该判断这个人有没有登陆

    Future.delayed(
        const Duration(seconds: 1), () => Get.snackbar("提示", "请先登录APP"));
    return const RouteSettings(name: Routes.login);
  }
}

// ignore: camel_case_types
class userIsFirstUseMiddleware extends GetMiddleware {
  // @override
  // int priority = 0;

  // RouteAuthMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    //看看这个人是不是第一次使用软件，如果是则跳转到welcome
    GetStorage gs = GetStorage();
    if (gs.read(LocalStorage.firstUse) == null) {
      print(gs.read(LocalStorage.firstUse));
      gs.write(LocalStorage.firstUse, "yes"); //这是第一次使用，不用操作，会直接去welcome页面
      // return const RouteSettings(name: Routes.welcome);
    } else {
      // print(gs.read(LocalStorage.firstUse));
      // print(gs.read("123"));
      return const RouteSettings(name: Routes.home);
      //不是第一次使用，直接去首页
    }
  }
}
