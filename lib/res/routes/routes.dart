import 'package:get/route_manager.dart';
import 'package:getx_mvvm_pattern/res/routes/route_name.dart';
import 'package:getx_mvvm_pattern/view/home/home_view.dart';
import 'package:getx_mvvm_pattern/view/login/login_view.dart';
import 'package:getx_mvvm_pattern/view/splash/splash_screen.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
            name: RouteName.splashView,
            page: () => const SplashScreen(),
            transitionDuration: const Duration(microseconds: 250),
            transition: Transition.leftToRightWithFade),

            GetPage(
            name: RouteName.loginView,
            page: () => const LoginView(),
            transitionDuration: const Duration(microseconds: 250),
            transition: Transition.leftToRightWithFade),

             GetPage(
            name: RouteName.homeView,
            page: () => const HomeView(),
            transitionDuration: const Duration(microseconds: 250),
            transition: Transition.leftToRightWithFade)
      ];
}

