import 'dart:convert';
import 'package:applicationform/app/modules/home/views/home_view.dart';
import 'package:applicationform/app/modules/secondlogin/views/secondlogin_view.dart';
import 'package:applicationform/model/user.dart';
import 'package:applicationform/utils/storage/UserSettingsPref.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart';
import 'package:response/response.dart' as Response;
import 'package:flutter/cupertino.dart';

class SecondloginController extends GetxController {
  RxString email = RxString('');
  RxString password = RxString('');
  final box = GetStorage();
  var dio = Dio();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  void emailChanged(String val) {
    email.value = val;
  }

  void passwordChanged(String val) {
    password.value = val;
  }

  //this part is designed for authentication with keycloak
  Future<void> submitFunction() async {
    Map<String, String> header = {
      'Content-Type': 'application/x-www-form-urlencoded',
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      "Access-Control-Allow-Headers":
          "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      "Access-Control-Allow-Methods": "POST, OPTIONS"
    };
    //Obtain access token for a user for login
    final response = await dio.post(
        'http://192.168.1.200:8015/realms/angular-keycloak/protocol/openid-connect/token',
        data: {
          'client_id': 'account',
          'client_secret': '1HpQ9cX19Uk8osNXOTRXvFW3K3BVhJQ6',
          'grant_type': 'password',
          'username': email.value,
          'password': password.value
        },
        options: Options(headers: header));
    Map<String, dynamic> user = jsonDecode(response.toString());

    print('refresh_token, ${user['refresh_token']}');
    box.write('access_token', '${user['access_token']}');
    box.write('refresh_token', '${user['refresh_token']}');
    // box.write('is_logged', true);
    var myuser = UserModel.fromJson(user);
    print("email" + myuser.email.toString());
    UserSettingsPref.setToken(user['access_token']);
    UserSettingsPref.setUser(UserModel.fromJson(user));
    var x = box.read('refresh_token');
    print(x);

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
    if (response.statusCode == 200) {
      // Get.off(HomeView());
      Get.to(HomeView());
    }
  }

  Map<String, String> header = {
    'Content-Type': 'application/x-www-form-urlencoded',
    "Accept": "application/json",
    "Access-Control-Allow-Origin": "*", // Required for CORS support to work
    "Access-Control-Allow-Headers":
        "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
    "Access-Control-Allow-Methods": "POST, OPTIONS"
  };

  Future<void> logoutFunction() async {
    var refrshtoken = box.read('refresh_token');
    final response = await dio.post(
      'http://192.168.1.200:8015/realms/angular-keycloak/protocol/openid-connect/logout',
      data: {
        //this method requires 3 parameters
        'client_id': 'account',
        'client_secret': '1HpQ9cX19Uk8osNXOTRXvFW3K3BVhJQ6',
        'refresh_token': refrshtoken
      },
      options: Options(headers: header),
    );
    if (response.statusCode == 204 || response.statusCode == 200) {
      box.remove('refresh_token');
      // box.write('is_logged', false);
      Get.to(() => SecondloginView());
    } else {
      print('there is an error');
    }
  }
}
