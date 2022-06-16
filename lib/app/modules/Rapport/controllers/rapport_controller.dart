import 'package:get/get.dart';
import 'package:applicationform/model/user.dart';
import 'package:applicationform/utils/storage/UserSettingsPref.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:response/response.dart' as Response;
import 'package:flutter/cupertino.dart';

class RapportController extends GetxController {
  TextEditingController textEditingController = TextEditingController();

  RxString desc = RxString('');
  RxString userId = RxString('');

  RxString departement = RxString('');

  RxString problem = RxString('');
  String dropDownValue = "";
  var selectedDate = DateTime.now().obs;
  var dio = Dio();
  final box = GetStorage();
  RxString errorText = "".obs;
  final userid = UserSettingsPref.getUser.sub;

  @override
  void onInit() {
    //useridChanged();
  }

  void descChanged(String val) {
    desc.value = val;
  }

  // void useridChanged() {
  //   userId.value = userid!;
  // }

  void departementChanged(String val) {
    departement.value = val;
  }

  void problemChanged(String val) {
    problem.value = val;
  }

  Future<void> Repport() async {
    var token = UserSettingsPref.getToken;

    Map<String, String> header = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/x-www-form-urlencoded',
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      "Access-Control-Allow-Headers":
          "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      "Access-Control-Allow-Methods": "POST, OPTIONS"
    }; // stopping the authentication operation for login
    var dt = {
      'userId': '5c2f1915-3db3-48b7-9089-40feda8f2580',
      'desc': desc.value,
      'department': departement.value,
      'problem': problem.value,
    };
    print(dt);
    final response = await dio.post('http://192.168.1.200:8000/api/makeReport',
        data: {
          'userId': '5c2f1915-3db3-48b7-9089-40feda8f2580',
          'desc': desc.value,
          'department': departement.value,
          'problem': problem.value,
        },
        options: Options(headers: header));
    if (response.statusCode == 200 || response.statusCode == 204) {
      print('booking succeeded');
    }
  }
}
