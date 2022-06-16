import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_screen_controller.dart';
import 'package:applicationform/app/modules/home/views/home_view.dart';
import 'package:applicationform/app/modules/secondlogin/views/secondlogin_view.dart';
import 'package:get_storage/get_storage.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  final box = GetStorage();
  SplashScreenController splashScreenController =
      Get.put(SplashScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 1, 31, 77).withOpacity(0.7),
                const Color.fromARGB(255, 255, 109, 0).withOpacity(0.7),
              ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
          child: Image.asset('assets/images/55.png'),
        ),
      ),
    );
  }
}
