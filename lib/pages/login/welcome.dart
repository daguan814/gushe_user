import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';


import 'package:get/get.dart';

import '../../common/config/assets.dart';

import '../../common/mywidget/MyButton.dart';
import '../../common/routes/Routes.dart';



class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  //主视图
  Widget _buildView() {
    return Column(
      children: [
        //轮播图片
        _imageView(),
        //按钮
        _buttonView(),
      ],
    );
  }

  //轮播图
  Widget _imageView() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
      child: CarouselSlider(
        //轮播图主要插件
        options: CarouselOptions(
          height: 700.0,
          enableInfiniteScroll: true, //无限轮播
          viewportFraction: 0.8, //视窗分数 ，缩小倍率，1.0就是不缩小
          enlargeCenterPage :true  ,//放大正在展示的页面
          autoPlay: true,
          pauseAutoPlayInFiniteScroll : true,

        ),
        items: [
          AssetsImg.welcomePng,
          AssetsImg.welcome2Png,
          AssetsImg.welcome3Png
        ].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  // decoration: BoxDecoration(color: Colors.amber),
                  child: Image.asset(i));
            },
          );
        }).toList(),
      ),
    );
  }

//按钮布局
  Widget _buttonView() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
           Directionality(
            //把icon图标放到右边
            textDirection: TextDirection.rtl,
            child: MyButtonWidget(onPressed: () {
              Get.offAllNamed(Routes.home);     //去往主页
            },), 
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _buildView()),
    );
  }
}
