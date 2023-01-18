import 'package:flutter/material.dart';

// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_login/flutter_login.dart';

import '../../common/config/assets.dart';
import '../../common/routes/Routes.dart';
import '../../controller/login/loginController.dart';

class LoginPage extends GetView<loginController> {
  //已经成功导入了，
//对象：controller
  const LoginPage({super.key});

  Duration get loginTime => const Duration(milliseconds: 2000); //点击登陆后转圈圈的时间

  Future<String?> _authUser(LoginData data) {
    //登陆 data：数据
    return Future.delayed(loginTime).then((_) async {
      controller.email = data.name; //用户名密码
      controller.password = data.password;
      await controller.login(); //执行登陆操作  //!!非常重要，需要异步执行程序，等待这边的赋值完成才能返回

      return controller.tip;
      
    });
  }

  Future<String?> _signupUser(SignupData data) {
    //注册

    return Future.delayed(loginTime).then((_) async {
      controller.email = data.name!;
      controller.password = data.password!;
      if (controller.password.length < 8) {
        return "密码过短，不安全,最少需要8个字符";
      }
      await controller.regi();
      return controller.tip;
    });
  }

  Future<String> _recoverPassword(String name) {
    //找回密码

    return Future.delayed(loginTime).then((_) {
      // if (!users.containsKey(name)) {
      //   return '用户不存在';
      // }
      return 'food';
    });
  }

  @override
  Widget build(BuildContext context) {
    Get.put(loginController());
    return FlutterLogin(
      messages: LoginMessages(
        loginButton: "登录",
        signupButton: "注册",
        forgotPasswordButton: "忘记密码？",
        recoverPasswordDescription: "系统将会给您的邮箱发送一个临时密码,建议您本次登录后立即去更改密码",
        recoverPasswordButton: "重置密码",
        recoverPasswordIntro: "请输入邮箱重置密码",
        goBackButton: "返回",
      ),
      title: ' ',
      logo: AssetsImg.logoPng,
      onLogin: _authUser,
      onSignup: _signupUser,
      onSubmitAnimationCompleted: () {
        //提交动画完成的操作
        Get.toNamed(Routes.home);
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
