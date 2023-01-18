
import 'package:get/get.dart';

import '../../pages/home/home.dart';
import '../../pages/login/infoComplete.dart';
import '../../pages/login/login.dart';
import '../../pages/login/splash.dart';
import '../../pages/login/welcome.dart';
import 'middleware.dart';


abstract class Routes {
  static const INITIAL = "/splash";
  static const welcome = "/splash/welcome";

  static const login = "/login";

  static const home = "/home";
  static const infoComplete = "/login/infoComplete";


  static final routes = [
    //白名单

    //层次 splash
    GetPage(name: INITIAL, page: () => SplashPage()),
    //层次 splash>welcome
    GetPage(name: Routes.welcome, page: () => const WelcomePage(),middlewares: [
      userIsFirstUseMiddleware(),
    ]),

    //层次 login
    GetPage(
        name: Routes.login,
        page: () => LoginPage(),
        transition: Transition.downToUp //转场动画
        ),

        //层次 /login/infoComplete
    GetPage(
        name: Routes.infoComplete,
        page: () => infoCompletePage(),
        transition: Transition.downToUp //转场动画
        ),

    //层次  home
    GetPage(name: Routes.home, page: () => HomePage()),

    // //测试页面，需要登陆才能使用的页面
    // GetPage(name: Routes.test, page: () => TestPage(), middlewares: [
    //   RouteAuthMiddleware(),
    // ] //去某个页面的时候判断一下有没有登陆，然后去登陆页面
    //     ),
    
  ];
}
