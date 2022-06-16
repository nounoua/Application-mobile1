import 'package:applicationform/app/modules/home/views/home_view.dart';

import 'package:applicationform/app/modules/secondlogin/views/secondlogin_view.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:response/response.dart' as Response;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:applicationform/utils/storage/UserSettingsPref.dart';

class HomeController extends GetxController {
  var dio = Dio();
  final box = GetStorage();

  //start the authentication operation for logout
  Map<String, String> header = {
    'Content-Type': 'application/x-www-form-urlencoded',
    "Accept": "application/json",
    "Access-Control-Allow-Origin": "*",
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
        'client_secret': 'tNKuFdCRkOpheIianf0oDHEYFTkpa3Wb',
        'refresh_token': refrshtoken
      },
      options: Options(headers: header),
    );
    if (response.statusCode == 204 || response.statusCode == 200) {
      box.remove('refresh_token');
      Get.to(() => SecondloginView());
    } else {
      print('there is an error');
    }
  }
  //stopping the authentication operation for logout

  void showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Search"),
              content: Container(
                height: 100,
                child: Column(
                  children: <Widget>[
                    Text("Enter what you are looking for"),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "write here",
                        border: InputBorder.none,
                      ),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                FlatButton(
                    onPressed: () {
                      Get.off(context);
                    },
                    child: Text("done ")),
                FlatButton(onPressed: () {}, child: Text("Close ")),
              ],
            ));
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {}
}
