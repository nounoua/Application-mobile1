import 'package:applicationform/app/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:applicationform/model/user.dart';
import 'package:applicationform/utils/storage/UserSettingsPref.dart';
import 'package:response/response.dart' as Response;
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';

class EditProfileController extends GetxController {
  TextEditingController textEditingController = TextEditingController();
  RxString userId = RxString('');
  RxString fname = RxString('');
  RxString partnerName = RxString('');

  final userid = UserSettingsPref.getUser.sub;
  var marriageDate = DateTime.now().obs;
  var dateBirth = DateTime.now().obs;
  RxString jour = RxString('');
  var selectedDate = DateTime.now().obs;
  final box = GetStorage();

  String dropDownValue = "";
  String dropDownValue1 = "";
  String dropDownValue2 = "";
  final count = 0.obs;
  var dio = Dio();
  @override
  void onInit() {
    textEditingController.obs.value.text = 'your initial text';
    // getUser();
    // useridChanged();
  }

  // void useridChanged() {
  //   userId.value = userid!;
  // }

  void fnameChanged(String val) {
    fname.value = val;
  }

  void partnerNameChanged(String val) {
    partnerName.value = val;
  }

  // void adresseChanged(String val) {
  //   dateBirth.value = val;
  // }

  void DateBirthChanged() async {
    await chooseDateBirth();
  }

  void MarriageDateChanged() async {
    await chooseMarriageDate();
  }

  chooseMarriageDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime(2000),
        lastDate: DateTime(2024),
        helpText: 'Select DOB',
        cancelText: 'Close',
        confirmText: 'Confirm',
        errorFormatText: 'Enter valid date',
        errorInvalidText: 'Enter valid date range',
        fieldLabelText: 'DOB',
        fieldHintText: 'Month/Date/Year',
        selectableDayPredicate: disableDate);
    if (pickedDate != null && pickedDate != selectedDate.value) {
      marriageDate.value = pickedDate;
    }
  }

  bool disableDate(DateTime day) {
    if ((day.isAfter(DateTime.now().subtract(Duration(days: 1))) &&
        day.isBefore(DateTime.now().add(Duration(days: 5))))) {
      return true;
    }
    return false;
  }

  chooseDateBirth() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime(2000),
        lastDate: DateTime(2024),
        helpText: 'Select DOB',
        cancelText: 'Close',
        confirmText: 'Confirm',
        errorFormatText: 'Enter valid date',
        errorInvalidText: 'Enter valid date range',
        fieldLabelText: 'DOB',
        fieldHintText: 'Month/Date/Year',
        selectableDayPredicate: disableDate);
    if (pickedDate != null && pickedDate != selectedDate.value) {
      marriageDate.value = pickedDate;
    }
  }

  bool disableDatem(DateTime day) {
    if ((day.isAfter(DateTime.now().subtract(Duration(days: 1))) &&
        day.isBefore(DateTime.now().add(Duration(days: 5))))) {
      return true;
    }
    return false;
  }

  Future<void> SubmitFunction() async {
    var access_token = box.read('access_token');

    Map<String, String> header = {
      'Authorization': 'Bearer $access_token',
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
      'fname': fname.value,
      'dateBirth': dateBirth.value,
      'PartnerName': partnerName.value,
      'marriageDate': selectedDate.value,
    };
    print(dt);
    final response = await dio.post('http://192.168.1.200:8000/api/Reclamation',
        data: {
          // 'client_id': 'keycloak',
          // 'client_secret': 'iPVnwgj0dy5FQcLuaCHrMnjFRY8Lsl4o',
          // 'grant_type': 'password',
          'userId': userId.value,
          'fname': fname.value,
          'dateBirth': dateBirth.value,
          'PartnerName': partnerName.value,
          'marriageDate': marriageDate.value
        },
        options: Options(headers: header));

    if (response.statusCode == 200) {
      print('reclamation succeeded');
      //Get.off(HomeView());
      //Get.to(HomeView());
    }
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
