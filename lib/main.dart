import 'package:applicationform/app/modules/home/views/home_view.dart';

import 'package:applicationform/app/modules/reclamationSick/views/reclamationSick_view.dart';
import 'package:applicationform/app/modules/splashScreen/bindings/splash_screen_binding.dart';
import 'package:applicationform/utils/storage/UserSettingsPref.dart';
import 'package:flutter/material.dart';
import 'package:applicationform/widget/inputDeco.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  UserSettingsPref.appPref.initStorage;
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialBinding: SplashScreenBinding(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
