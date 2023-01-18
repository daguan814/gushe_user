import 'package:flutter/material.dart';



import 'package:get/get.dart';

import '../../common/config/app_colors.dart';
import '../../common/config/assets.dart';
import '../../common/routes/Routes.dart';



//启动页
class SplashPage extends GetView {
  SplashPage({super.key});
  var number = 2.obs;  //splash页面的秒数

  Future<void> countDown() async {
    //异步函数
    for (var i = 0; i < number.value;) {
      await Future.delayed(const Duration(seconds: 1), (() {
        number--;
      }));
    }
    if (number.value == 0) {
      Get.offAndToNamed(Routes.welcome);
    } 
  }

  //logo
  Widget _buildLogo() {
    return Stack(alignment: Alignment.center, children: [
      Container(
        width: 160,
        height: 160,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30)),
      ),
      Image.asset(AssetsImg.logoPng)
    ]);
  }

  //主视图
  Widget _buildview(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            //放射形渐变
            colors: AppColors.changeSplashColor, //背景渐变
          ),
        ),
        child: Center(
          //渐变色背景后，这里是背景上要显示的内容
          child: Column(
              //屏幕中心显示
              mainAxisAlignment: MainAxisAlignment.center,
              children: [                                                       
                //logo
                _buildLogo(),

                //标题
                const Text(
                  "古摄简影",
                  textScaleFactor: 1.5,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    height: 2,
                  ),
                ),

                const Text(
                  "专业摄影服务平台",
                  textScaleFactor: 1,
                  style: TextStyle(
                    color: Colors.blueAccent,
                  ),
                ),

                //倒计时计数器
                Obx(() => Text(
                      number > 0 ? "$number" : "done",
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          height: 3),
                    )),
                //end
              ]),
        ),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    countDown();
    return Scaffold(
      backgroundColor: AppColors.backgroundSplash,
      body: _buildview(context),
    );
  }
}
