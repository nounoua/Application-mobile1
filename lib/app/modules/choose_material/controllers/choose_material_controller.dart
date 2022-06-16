import 'package:applicationform/app/modules/choose_material/views/choose_material_view.dart';
import 'package:applicationform/app/modules/home/views/home_view.dart';
import 'package:applicationform/model/user.dart';
import 'package:applicationform/utils/dropdown_object.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:applicationform/utils/dropdown_object.dart';
import 'package:applicationform/model/user.dart';
import 'package:applicationform/utils/storage/UserSettingsPref.dart';
import 'package:get_storage/get_storage.dart';

class ChooseMaterialController extends GetxController {
  TextEditingController textEditingController = TextEditingController();

  RxString userId = ''.obs;
  RxString email = ''.obs;
  RxString mouse = RxString('');
  RxString screen = RxString('');
  RxString desk = RxString('');
  RxString jour = RxString('');
  var selectedDate = DateTime.now().obs;

  var dio = Dio();
  final box = GetStorage();
  RxString errorText = "".obs;
  //final userid = UserSettingsPref.getUser.sub;

  var startDate = DateTime.now().obs;
  var enndDate = DateTime.now().obs;

  @override
  void onInit() {
    textEditingController.obs.value.text = 'your initial text';

    useridChanged();
  }

  void emailChanged(String val) {
    email.value = val;
  }

  void useridChanged() {
    // userId.value = userid!;
  }

  void mouseChanged(String val) {
    mouse.value = val;
  }

  void screenChanged(String val) {
    screen.value = val;
  }

  void deskChanged(String val) {
    desk.value = val;
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

  Future<void> BookingMaterialFunction() async {
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
      'desk': desk.value,
      'screen': screen.value,
      'mouse': mouse.value,
      'startDate': startDate.value,
      'enndDate': enndDate.value,
    };
    print(dt);
    final response = await dio.post('http://192.168.1.200:8000/api/Reclamation',
        data: {
          // 'client_id': 'keycloak',
          // 'client_secret': 'iPVnwgj0dy5FQcLuaCHrMnjFRY8Lsl4o',
          // 'grant_type': 'password',
          'userId': userId.value,
          'email': email.value,
          'desk': desk.value,
          'screen': screen.value,
          'mouse': mouse.value,

          //'duration': duration.value,
        },
        options: Options(headers: header));

    if (response.statusCode == 200) {
      print('booking succeeded');
    }
  }

  Future<void> AddReservation() async {
    var token = UserSettingsPref.getToken;
    print('this access token');
    print(token);
    var dt = {
      // 'client_id': 'keycloak',
      // 'client_secret': 'iPVnwgj0dy5FQcLuaCHrMnjFRY8Lsl4o',
      // 'grant_type': 'password',
      'userId': userId.value,
      'email': email.value,
      'desk': desk.value,
      'screen': screen.value,
      'mouse': mouse.value,
      'startDate': startDate.value,
      'enndDate': enndDate.value,
    };
    print(dt);
    Map<String, String> header = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/x-www-form-urlencoded',
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      "Access-Control-Allow-Headers":
          "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      "Access-Control-Allow-Methods": "POST, OPTIONS"
    }; // stopping the authentication operation for getUser
    print('this is your header');
    print(header);

    //Obtain access token for a user to show information
    var response =
        await dio.post('http://192.168.1.200:8000/api/makeReservation',
            data: {
              'userId': userId.value,
              'email': email.value,
              "desk": desk.value,
              "screen": screen.value,
              "mouse": mouse.value,
              "start": startDate.value,
              "end": enndDate.value
            },
            options: Options(headers: header));

    if (response.statusCode == 200 || response.statusCode == 201) {
      // print('reservation succeed');
      // Get.to(ChooseMaterialView());
    }
  }

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
        'http://192.168.1.200:8015/realms/angular-keycloak/protocol/openid-connect/userinfo',
        options: Options(headers: header));
    var user = UserModel.fromJson(response.data);
    UserSettingsPref.setUser(user);
    userId.value = UserSettingsPref.getUser.sub.toString();
    email.value = UserSettingsPref.getUser.email.toString();

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
