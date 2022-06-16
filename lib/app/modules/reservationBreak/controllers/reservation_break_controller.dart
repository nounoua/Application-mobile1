import 'dart:convert';
import 'package:applicationform/app/modules/home/views/home_view.dart';

import 'package:applicationform/model/user.dart';
import 'package:applicationform/utils/storage/UserSettingsPref.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:response/response.dart' as Response;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ReservationBreakController extends GetxController {
  TextEditingController textEditingController = TextEditingController();

  RxString title = RxString('');
  RxString userId = RxString('');
  RxString email = RxString('');
  RxString departement = RxString('');
  RxString chef = RxString('');
  RxString jour = RxString('');
  var selectedDate = DateTime.now().obs;
  var startDate = DateTime.now().obs;
  var enndDate = DateTime.now().obs;
  var dio = Dio();
  final box = GetStorage();
  RxString errorText = "".obs;
  final userid = UserSettingsPref.getUser.sub;

  @override
  void onInit() {
    // useridChanged();
  }

  void titleChanged(String val) {
    title.value = val;
  }

  // void useridChanged() {
  //   userId.value = userid!;
  // }

  void emailChanged(String val) {
    email.value = val;
  }

  void departementChanged(String val) {
    departement.value = val;
  }

  void chefChanged(String val) {
    chef.value = val;
  }

  void StartDateChanged() async {
    await chooseStartDate();
  }

  void endDateChanged() async {
    await chooseEndDate();
  }

  chooseStartDate() async {
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
      startDate.value = pickedDate;
    }
  }

  chooseEndDate() async {
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
      enndDate.value = pickedDate;
    }
  }

  bool disableDate(DateTime day) {
    if ((day.isAfter(DateTime.now().subtract(Duration(days: 1))) &&
        day.isBefore(DateTime.now().add(Duration(days: 5))))) {
      return true;
    }
    return false;
  }

  Future<void> BookingFunction() async {
    var access_token = box.read('access_token');
    print(access_token);
    Map<String, String> header = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': "Bearer " + access_token,
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      "Access-Control-Allow-Headers":
          "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      "Access-Control-Allow-Methods": "POST, OPTIONS"
    };
    //Obtain access token for a user for login
    // Map<String, String> datas = {
    //   'userId': userId.value,
    //   'email': email.value,
    //   'departement': departement.value,
    //   'chef': chef.value,
    //   'title': title.value,
    //   'start': startDate.value.toString(),
    //   'end': enndDate.value.toString(),
    // };
    // print("datas " + datas.toString());
    final response =
        await dio.post('http://192.168.1.200:8000/api/MakeBreakBooking',
            data: {
              'userId': '5c2f1915-3db3-48b7-9089-40feda8f2580',
              'email': email.value,
              'departement': departement.value,
              'chef': chef.value,
              'title': title.value,
              'start': startDate.value.toString(),
              'end': enndDate.value.toString(),
            },
            options: Options(headers: header));
    // Map<String, dynamic> user = jsonDecode(response.toString());
    const snackBar = SnackBar(
      content: Text('Yay! A SnackBar!'),
    );
    if (response.statusCode == 204 ||
        response.statusCode == 200 ||
        response.statusCode == 201) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
    }
  }
}
