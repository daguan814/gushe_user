import 'package:flutter/material.dart';


import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'common/routes/Routes.dart';

void main() async {
  await GetStorage.init(); //本地存储初始化
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      initialRoute: Routes.INITIAL, //初始路由
      debugShowCheckedModeBanner: false, //不显示debug的框
      getPages: Routes.routes, //注册所有路由，路由都在config目录里

      theme: ThemeData(
        primarySwatch: Colors.lightBlue, //全局按钮颜色
      ),
    );
  }
}
