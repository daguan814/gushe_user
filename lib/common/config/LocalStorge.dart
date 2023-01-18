//本地存储的内容初始化

import 'package:get_storage/get_storage.dart';

class LocalStorage {
  //定义本地存储的
  // ignore: constant_identifier_names
  static const Token = "token";     //登陆成功后存入
  static const firstUse = "firstUse";     //第一次使用软件时存入
  static const  email= "email";        //注册或者登陆成功后存入
  static const userInfoMap = "userInfoMap";     //用户个人信息，信息修改后或者登陆成功后刷新
}
