import 'package:applicationform/model/user.dart';
import 'package:applicationform/utils/WAWidgets.dart';
import 'package:applicationform/utils/dropdown_object.dart';
import 'package:applicationform/widget/drawer.dart';
import 'package:applicationform/widget/dropdown/pcm_dropdown.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import '../controllers/choose_material_controller.dart';
import 'package:multiselect/multiselect.dart';
import 'package:applicationform/utils/dropdown_object.dart';
import 'package:image_picker/image_picker.dart';

class ChooseMaterialView extends GetView<ChooseMaterialController> {
  ChooseMaterialController controller = Get.put(ChooseMaterialController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 1, 31, 77),
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Container(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Choose material',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: Color.fromARGB(255, 1, 31, 77),
                      ),
                    ),
                    5.height,
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(
                              color: Color.fromARGB(255, 1, 31, 77), width: 1)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'User Id',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              color: Color.fromARGB(255, 1, 31, 77),
                            ),
                          ),
                          8.height,
                          Obx(() => AppTextField(
                                decoration: waInputDecoration(
                                  hint: '5c2f1915-3db3-48b7-9089-40feda8f2580',
                                  bgColor: Colors.white70,
                                  prefixIcon: Icons.fingerprint,
                                ),
                                textFieldType: TextFieldType.NAME,
                                keyboardType: TextInputType.name,
                                // controller: fullNameController,
                                //focus: fullNameFocusNode,
                              )),
                          Text(
                            'Email',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              color: Color.fromARGB(255, 1, 31, 77),
                            ),
                          ),
                          8.height,
                          AppTextField(
                            decoration: waInputDecoration(
                                hint: 'Enter your email',
                                bgColor: Colors.white70,
                                prefixIcon: Icons.email),
                            textFieldType: TextFieldType.EMAIL,
                            keyboardType: TextInputType.emailAddress,
                            onChanged: controller.emailChanged,
                          ),
                          16.height,
                          Text(
                            'Screen',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              color: Color.fromARGB(255, 1, 31, 77),
                            ),
                          ),
                          8.height,
                          DropdownButtonFormField(
                            isExpanded: true,
                            decoration: waInputDecoration(
                                prefixIcon: Icons.desktop_mac,
                                bgColor: Colors.white70,
                                hint: "Select your screen"),
                            items: <String>['sc1', 'sc2', 'sc3', 'sc4']
                                .map((String value) {
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: Text(value, style: secondaryTextStyle()),
                              );
                            }).toList(),
                            onChanged: (value) {
                              controller.screenChanged(value.toString());
                            },
                          ),
                          16.height,
                          Text(
                            'Mouse',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              color: Color.fromARGB(255, 1, 31, 77),
                            ),
                          ),
                          8.height,
                          DropdownButtonFormField(
                            isExpanded: true,
                            decoration: waInputDecoration(
                                prefixIcon: Icons.mouse,
                                bgColor: Colors.white70,
                                hint: "Select your departement"),
                            items: <String>['m1', 'M2', 'm3', 'm4']
                                .map((String value) {
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: Text(value, style: secondaryTextStyle()),
                              );
                            }).toList(),
                            onChanged: (value) {
                              controller.mouseChanged(value.toString());
                            },
                          ),
                          16.height,
                          Text(
                            'Desk',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              color: Color.fromARGB(255, 1, 31, 77),
                            ),
                          ),
                          8.height,
                          DropdownButtonFormField(
                            isExpanded: true,
                            decoration: waInputDecoration(
                                prefixIcon: Icons.meeting_room,
                                bgColor: Colors.white70,
                                hint: "Desk"),
                            items: <String>['Desk1', 'Desk2', 'Desk3', 'Desk4']
                                .map((String value) {
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: Text(value, style: secondaryTextStyle()),
                              );
                            }).toList(),
                            onChanged: (value) {
                              controller.deskChanged(value.toString());
                            },
                          ),
                          16.height,
                          Text(
                            'Start Date',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              color: Color.fromARGB(255, 1, 31, 77),
                            ),
                          ),
                          8.height,
                          Obx(
                            () => AppTextField(
                                decoration: waInputDecoration(
                                    bgColor: Colors.white70,
                                    hint: DateFormat()
                                        .add_yMd()
                                        .format(controller.startDate.value),
                                    prefixIcon: Icons.calendar_today),
                                textFieldType: TextFieldType.OTHER,
                                keyboardType: TextInputType.datetime,
                                // onChanged:controller.jourChanged();
                                onTap: (() => {
                                      controller.StartDateChanged(),
                                    })),
                          ),
                          16.height,
                          Text(
                            'End Date',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              color: Color.fromARGB(255, 1, 31, 77),
                            ),
                          ),
                          8.height,
                          Obx(
                            () => AppTextField(
                                decoration: waInputDecoration(
                                    bgColor: Colors.white70,
                                    hint: DateFormat()
                                        .add_yMd()
                                        .format(controller.enndDate.value),
                                    prefixIcon: Icons.calendar_today),
                                textFieldType: TextFieldType.OTHER,
                                keyboardType: TextInputType.datetime,
                                // onChanged:controller.jourChanged();
                                onTap: (() => {
                                      controller.endDateChanged(),
                                    })),
                          ),
                        ],
                      ),
                    ),
                    16.height,
                    AppButton(
                            color: Color.fromARGB(255, 1, 31, 77),
                            width: Get.width,
                            child: Text(
                              'Booking',
                              style:
                                  boldTextStyle(color: Colors.white, size: 20),
                            ),
                            onTap: () {
                              controller.getUser();
                              controller.showMyDialog();
                            })
                        .cornerRadiusWithClipRRect(30)
                        .paddingOnly(
                            left: Get.width * 0.1, right: Get.width * 0.1),
                  ],
                ),
              ),
            ),
          ],
        ).paddingTop(60),
      ),
    );
  }
}
