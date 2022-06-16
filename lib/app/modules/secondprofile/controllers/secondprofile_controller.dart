import 'package:applicationform/app/modules/home/views/home_view.dart';
import 'package:applicationform/app/modules/secondprofile/views/secondprofile_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:applicationform/model/user.dart';
import 'package:applicationform/utils/storage/UserSettingsPref.dart';
import 'package:flutter/material.dart';
import 'package:response/response.dart' as Response;
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';

class SecondprofileController extends GetxController {
  TextEditingController textEditingController = TextEditingController();
  RxString userId = ''.obs;

  final box = GetStorage();
  RxString email = ''.obs;
  RxString pictureUrl = ''.obs;

  RxString Nationality = RxString('');
  RxString NumberChild = RxString('');
  RxString Address = RxString('');
  RxString color = RxString('');
  RxString FacebookLink = RxString('');
  RxString LinkedinLink = RxString('');
  RxString InstgLink = RxString('');

  var dio = Dio();
  final count = 0.obs;
  @override
  void onInit() {
    textEditingController.obs.value.text = 'your initial text';
    getUser();
    useridChanged();
  }

  void useridChanged() {
    //userId.value = '120';
  }

  void emailChanged(String val) {
    email.value = val;
  }

  void nationalityChanged(String val) {
    Nationality.value = val;
  }

  void NumberChildChanged(String val) {
    NumberChild.value = val;
  }

  void colorFavChanged(String val) {
    color.value = val;
  }

  void facebookLinkChanged(String val) {
    FacebookLink.value = val;
  }

  void LinkedinChanged(String val) {
    LinkedinLink.value = val;
  }

  void adresseChanged(String val) {
    Address.value = val;
  }

  void instagramLinkChanged(String val) {
    InstgLink.value = val;
  }

  Future<void> SubmitFunction() async {
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
      // 'client_id': 'keycloak',
      // 'client_secret': 'iPVnwgj0dy5FQcLuaCHrMnjFRY8Lsl4o',
      // 'grant_type': 'password',
      'userId': userId.value,
      'email': email.value,
      'color': color.value,
      'LinkedinLink': LinkedinLink.value,
      'InstgLink': InstgLink.value,
      'NumberChild': NumberChild.value,
      'FacebookLink': FacebookLink.value,
      'Address': Address.value,
      'Nationality': Nationality.value
    };
    print(dt);
    final response = await dio.post('http://192.168.1.200:8000/api/Reclamation',
        data: {
          // 'client_id': 'keycloak',
          // 'client_secret': 'iPVnwgj0dy5FQcLuaCHrMnjFRY8Lsl4o',
          // 'grant_type': 'password',
          'userId': userId.value,
          'email': email.value,
          'color': color.value,
          'LinkedinLink': LinkedinLink.value,
          'InstgLink': InstgLink.value,
          'NumberChild': NumberChild.value,
          'FacebookLink': FacebookLink.value,
          'Address': Address.value,
          'Nationality': Nationality.value
        },
        options: Options(headers: header));

    if (response.statusCode == 204 ||
        response.statusCode == 200 ||
        response.statusCode == 201) {
      // Get.snackbar("Success", "Add Successfully",
      //     snackPosition: SnackPosition.BOTTOM,
      //     backgroundColor: Colors.deepOrange,
      //     colorText: Colors.white);
      //ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
    } else if (response == '') {
      // Get.snackbar("Error", "there is an error",
      //     snackPosition: SnackPosition.BOTTOM,
      //     backgroundColor: Colors.deepOrange,
      //     colorText: Colors.white);
    }
  }

  //cette fonctuin est pour l'obtention les informations du user
  Future<void> getUser() async {
    var token = UserSettingsPref.getToken;
    print('this access token');
    print(token);
    Map<String, String> header = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/x-www-form-urlencoded',
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      "Access-Control-Allow-Headers":
          "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      "Access-Control-Allow-Methods": "GET, OPTIONS"
    }; // stopping the authentication operation for getUser
    print('this is your header');
    print(header);

    //Obtain access token for a user to show information
    var response = await dio.get(
        'http://192.168.137.1:8015/realms/angular-keycloak/protocol/openid-connect/userinfo',
        options: Options(headers: header));
    var user = UserModel.fromJson(response.data);
    UserSettingsPref.setUser(user);
    userId.value = UserSettingsPref.getUser.sub.toString();
    email.value = UserSettingsPref.getUser.email.toString();
    pictureUrl.value = UserSettingsPref.getUser.picture.toString();

    print(userId.value);
  }

  Future<void> showMyDialog() async {
    return showDialog<void>(
      context: Get.context!,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
                Get.to(HomeView());
              },
            ),
          ],
        );
      },
    );
  }
}
