import 'package:flutter/material.dart';
import 'package:flutter_gushejianying/pages/home/hanbokZu/hanbokZuController.dart';
import 'package:flutter_gushejianying/pages/home/homeController.dart';
import 'package:flutter_gushejianying/pages/home/home.dart';
import 'package:get/get.dart';

class hanbokZuPage extends GetView<hanbokZuController> {
  @override
  Widget build(BuildContext context) {
    Get.put(hanbokZuController());

    return Scaffold(body: SafeArea(child: Text('hanbokZuController')));
  }
}
