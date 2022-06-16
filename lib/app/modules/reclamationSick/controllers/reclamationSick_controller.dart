import 'dart:convert';
import 'dart:io';
import 'package:applicationform/model/user.dart';
import 'package:applicationform/utils/storage/UserSettingsPref.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:dio/dio.dart' as http_dio;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ReclamationController extends GetxController {
  TextEditingController textEditingController = TextEditingController();
  RxString fname = RxString('');
  RxString userId = RxString('');
  RxString email = RxString('');

  final box = GetStorage();

  RxString lName = RxString('');

  RxString cause = RxString('');

  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;

  RxString departement = RxString('');
  RxString chef = RxString('');
  var selectedDate = DateTime.now().obs;
  var startDate = DateTime.now().obs;
  var enndDate = DateTime.now().obs;
  String dropDownValue = "";
  var dio = new http_dio.Dio();

  RxString errorText = "".obs;
  final userid = UserSettingsPref.getUser.sub;
  final count = 0.obs;

  @override
  void onInit() {
    // textEditingController.obs.value.text = 'your initial text';
    // submitFunction();
    // useridChanged();
  }

  // void useridChanged() {
  //   //userId.value = '120';
  // }

  void FirstNameChanged(String val) {
    fname.value = val;
    print(fname.value);
  }

  // void useridChanged() {
  //   userId.value = userid!;
  //   print(userId.value);
  // }

  void emailChanged(String val) {
    email.value = val;
  }

  void causeChanged(String val) {
    cause.value = val;
  }

  void GetImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().getImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      File file = File(selectedImagePath.value);
    } else {
      Get.snackbar("Error", "No image Selected",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  void LastNameChanged(String val) {
    lName.value = val;
    print(lName.value);
  }

  void departementChanged(String val) {
    departement.value = val;
  }

  void chefChanged(String val) {
    chef.value = val;
  }

  void StartDateChanged() async {
    await chooseStartDate();
    print(startDate.value);
  }

  void endDateChanged() async {
    await chooseEndDate();
    print(enndDate.value);
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

  Future<void> submitFunction() async {
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
    Map<String, String> datas = {
      'userId': '5c2f1915-3db3-48b7-9089-40feda8f2580',
      'prenom': lName.value,
      'nom': fname.value,
      'email': email.value,
      'departement': departement.value,
      'chef': chef.value,
      'image': selectedImagePath.value,
      'cause': cause.value,
      'start': startDate.value.toString(),
      'end': enndDate.value.toString(),
    };
    print("datas " + datas.toString());
    String fileName = selectedImagePath.value.split('/').last;

    var formData = http_dio.FormData.fromMap({
      'userId': '5c2f1915-3db3-48b7-9089-40feda8f2580',
      "image": await http_dio.MultipartFile.fromFile(selectedImagePath.value,
          filename: fileName),
      'prenom': lName.value,
      'nom': fname.value,
      'email': email.value,
      'departement': departement.value,
      'chef': chef.value,
      'cause': cause.value,
      'start': startDate.value,
      'end': enndDate.value,
    });

    final response = await dio.post('http://192.168.1.200:8000/api/Reclamation',
        data: formData, options: http_dio.Options(headers: header));
    // var user = UserModel.fromJson(response.data);
    // UserSettingsPref.setUser(user);
    // userId.value = UserSettingsPref.getUser.sub.toString();
    // email.value = UserSettingsPref.getUser.email.toString();

    print(userId.value);

    // if (response.statusCode == 204 ||
    //     response.statusCode == 200 ||
    //     response.statusCode == 201) {}
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
              },
            ),
          ],
        );
      },
    );
  }
}
