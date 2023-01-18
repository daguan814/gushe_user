import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../common/mywidget/MyButton.dart';
import '../../common/routes/Routes.dart';

class HomePage extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('首页')),
        body: SafeArea(
            child: Column(
          children: [
            MyButtonWidget(text: "去登陆",
              onPressed: () {
                Get.toNamed(Routes.login);
              },
            )
          ],
        )));
  }
}
