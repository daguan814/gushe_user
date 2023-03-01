import 'package:flutter/material.dart';
import 'package:flutter_gushejianying/pages/home/homeController.dart';
import 'package:flutter_gushejianying/pages/home/sheyingService/sheyingServiceController.dart';
import 'package:get/get.dart';

class sheyingServicePage extends GetView<sheyingServiceController> {
  @override
  Widget build(BuildContext context) {
    Get.put(sheyingServiceController());

    return const Scaffold(
        body: SafeArea(child: Text('sheyingServiceController')));
  }
}
