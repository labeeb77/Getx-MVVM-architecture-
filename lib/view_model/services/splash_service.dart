import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:getx_mvvm_pattern/res/routes/route_name.dart';
import 'package:getx_mvvm_pattern/view_model/controller/user_preferences/user_pref.dart';

class SplashService {
  void isLogin() {
    UserPreferences userPreferences = UserPreferences();
  

    userPreferences.getUser().then((value) {

      log(value.isLogin.toString());
      log(value.token.toString());

      if (value.isLogin == false|| value.isLogin.toString() == 'null') {
        Timer(
            const Duration(seconds: 3), () => Get.toNamed(RouteName.loginView));
      } else {
        Timer(
            const Duration(seconds: 3), () => Get.toNamed(RouteName.homeView));
      }
    });
  }
}
