import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'userInfoShowController.dart';

class userInfoShowPage extends GetView<userInfoShowController> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    appBar: AppBar(title: const Text('userInfoShowPage')),

    body: const SafeArea(
      child: Text('userInfoShowController'))
    );
  }
}