import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gushejianying/pages/home/hanbokSell/hanbokSell.dart';
import 'package:flutter_gushejianying/pages/home/hanbokZu/hanbokZu.dart';
import 'package:flutter_gushejianying/pages/home/sheyingService/sheyingService.dart';
import 'package:get/get.dart';

import '../../controller/login/homeController.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    
    return Scaffold(
        appBar: AppBar(
          title: const Text("古摄丽影",
          style: TextStyle(
            color: Colors.amberAccent
          ),),

        ),
        drawer: Drawer(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                
                //?头像组
                /// 1.头像
                /// 2.昵称
                /// 3.vip身份铭牌，积分
                
                //?信息组
                /// 1.信息管理
                /// 2.消费记录
                /// 3.修改密码
                /// 4.订单记录
                /// 5.退出登陆
                /// 


              ],
            ),
          ),
        ),
        body: PersistentTabView(
          context,
          controller: controller.tabController,
          screens: _buildScreens(),
          items: _navBarsItems(),
          confineInSafeArea: true,
          backgroundColor: Colors.white, // Default is Colors.white.
          handleAndroidBackButtonPress: true, // Default is true.
          resizeToAvoidBottomInset:
              true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
          stateManagement: true, // Default is true.
          hideNavigationBarWhenKeyboardShows:
              true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(10.0),
            colorBehindNavBar: Colors.white,
          ),
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: const ItemAnimationProperties(
            // Navigation Bar's items animation properties.
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            // Screen transition animation on change of selected tab.
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle
              .style1, // Choose the nav bar style with this property.
        ));
  }

//?这是home总的页面路由
  List<Widget> _buildScreens() {
    return [sheyingServicePage(), hanbokZuPage(),hanbokSellPage()];
  }

//?底部导航栏
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.brightness_7),
        title: ("摄影服务"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.date_range),
        title: ("汉服租赁"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.shop_2),
        title: ("汉服售卖"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }
}
