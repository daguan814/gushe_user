import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'hanbokSellController.dart';

class hanbokSellPage extends GetView<hanbokSellController> {
  const hanbokSellPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(hanbokSellController());

    return const Scaffold(body: SafeArea(child: Text('hanbokSellController')));
  }
}
