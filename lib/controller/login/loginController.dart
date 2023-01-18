import 'package:flutter/material.dart';
import 'package:flutter_gushejianying/API/Login&Regi/loginApi.dart';
import 'package:flutter_gushejianying/API/Login&Regi/loginReq.dart';
import 'package:flutter_gushejianying/API/Login&Regi/regiAPI.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../API/Login&Regi/regiReq.dart';
import '../../API/Result.dart';
import '../../common/config/LocalStorge.dart';
import '../../common/routes/Routes.dart';

//登陆、注册、忘记密码的逻辑控制

// ignore: camel_case_types
class loginController extends GetxController {
  Map<String, dynamic> userInfo = {}; //用来存储用户信息
  var email = ' ';
  var password = ' ';
  String tip = "初始化";

  GetStorage gs = GetStorage();

  // //?执行登陆操作
  login() async {
    ///前端信息封装 email和 密码
    LoginReq params = LoginReq(email: email, pwd: password);

    ///将信息发送到后端获取用户信息
    Result result = await loginApi.userlogin(params: params);
    //TODO 判断登陆是否成功,和用户状态
    if (result.code == 200) {
      //登陆成功,将信息全部放到本地存储中，以map的方式。
      userInfo.addAll({
        'regiDate': result.data["regiDate"],
        'vipGoal': result.data["vipGoal"],
        'vipGrade': result.data["vipGrade"],
        'money': result.data["money"],
        'nickName': result.data["nickName"],
        'sex': result.data["sex"],
        'phone': result.data["phone"],
        'headImg': result.data["headImg"],
        'trueName': result.data["trueName"],
        'age': result.data["age"],
      });
      gs.write(LocalStorage.email, email); //!email记录
      gs.write(LocalStorage.Token, result.map["token"]); //!token记录
      gs.write(LocalStorage.userInfoMap, userInfo); //!将用户信息以map的形式存入内存
      //?存入完毕，进入主页
      print(gs.read(LocalStorage.email));
      print(gs.read(LocalStorage.userInfoMap));
      Get.toNamed(Routes.home);
    } else if (result.code == 100) {
      //todo 密码错误
      // print("该账号不存在或密码错误！");
      tip = "该账号不存在或密码错误！";
    } else if (result.code == 300) {
      //todo 信息没补全
      Get.snackbar("提醒", "您还没有补全信息，请补全信息后使用",
      duration: const Duration(seconds: 10),
        icon: const Icon(
          Icons.account_circle,
          color: Colors.red,
        ),
      );
      Get.offAllNamed(Routes.infoComplete);
    } else if (result.code == 0) {
      //todo 账号被禁
      tip = "您的账号已被禁用,请联系管理员，微信:17362845575";
    } else {
      tip = "网络出错了！";
    }

    ///后端个人信息保存到本地，跳转到主页
    //登陆成功
  }

  //?执行注册操作
  regi() async {
    //提交账户信息到后端验证
    //1.账户信息封装到对象里面，并且发送请求
    RegiReq params = RegiReq(email: email, pwd: password);
    Result result = await regiAPI.userRegi(params: params);

    // print(result.map["123"]);  //!获取map的值

    //注册成功！
    if (result.code == 200) {
      //显示注册成功的消息
      Get.snackbar(
        email,
        "注册成功，接下来请您输入一些必要信息以让我们更好的为您服务",
        duration: const Duration(seconds: 10),
        icon: const Icon(
          Icons.account_circle,
          color: Colors.blue,
        ),
      );
      //注册成功，跳转到信息补全页面，并把email存入内存,用于信息完善时获取。
      gs.write(LocalStorage.email, email);
      Get.offAllNamed(Routes.infoComplete);
    } else {
      tip = "账号已存在";
    }
  }
}
