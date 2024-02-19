import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_pattern/model/login/login_res_model.dart';
import 'package:getx_mvvm_pattern/repository/login_repository/login_repository.dart';
import 'package:getx_mvvm_pattern/res/routes/route_name.dart';
import 'package:getx_mvvm_pattern/utils/utils.dart';
import 'package:getx_mvvm_pattern/view_model/controller/user_preferences/user_pref.dart';

class LoginViewModel extends GetxController {
  final _api = LoginRepository();

  UserPreferences userPreferences = UserPreferences();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final emailFocus = FocusNode().obs;
  final passwordFocus = FocusNode().obs;

  void clearTextController() {
    emailController.value.clear();
    passwordController.value.clear();
  }

  RxBool loading = false.obs;

  void loginApi() {
    if (emailController.value.text.isNotEmpty &&
        passwordController.value.text.isNotEmpty) {
      loading.value = true;
      Map data = {
        "email": emailController.value.text,
        "password": passwordController.value.text
      };

      _api.loginApi(data).then((value) {
        loading.value = false;
        if (value['error'] == 'user not found') {
          log(value['error']);
          Utils.snackBar('Login ', value['error']);
        } else {
          LoginResModel resModel =
              LoginResModel(token: value['token'], isLogin: true);

          userPreferences.saveUser(resModel).then((value) {
            Get.toNamed(RouteName.homeView);
             Utils.snackBar('Login', 'login successful');
          }).onError((error, stackTrace) {});
         
        }
      }).onError((error, stackTrace) {
        loading.value = false;
        if (kDebugMode) {
          print(error.toString());
        }
        Utils.snackBar('Error', error.toString());
      });
     
    }
  }
  @override
  void dispose() {
  clearTextController();
    super.dispose();
  }
}
