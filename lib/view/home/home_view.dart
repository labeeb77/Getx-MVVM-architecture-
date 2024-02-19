import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:getx_mvvm_pattern/res/routes/route_name.dart';
import 'package:getx_mvvm_pattern/view_model/controller/user_preferences/user_pref.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  UserPreferences userPreferences = UserPreferences();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text("Home View"),
        actions: [IconButton(onPressed: (){
          userPreferences.removeUser().then((value) {
            Get.toNamed(RouteName.loginView);

          });
          
        }, icon: const Icon(Icons.logout))],
      ),
    );
  }
}