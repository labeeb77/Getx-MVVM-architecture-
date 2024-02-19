import 'package:flutter/material.dart';
import 'package:getx_mvvm_pattern/res/images/images.dart';
import 'package:getx_mvvm_pattern/view_model/services/splash_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashService splashService = SplashService();

  @override
  void initState() {
    splashService.isLogin();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
    body: Image(
      image: AssetImage(ImageAssets.splashScreen),fit: BoxFit.fill,),
    );
  }
}