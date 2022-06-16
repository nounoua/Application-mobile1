import 'dart:io';

import 'package:applicationform/utils/WAWidgets.dart';
import 'package:applicationform/utils/storage/UserSettingsPref.dart';
import 'package:applicationform/widget/drawer.dart';
import 'package:flutter/material.dart';
import 'package:applicationform/widget/inputDeco.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../../widget/dropdown/pcm_dropdown.dart';
import '../controllers/reclamationSick_controller.dart';
import 'dart:async';

class ReclamationSickView extends GetView<ReclamationController> {
  TextEditingController userId = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ReclamationController controller = ReclamationController();

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
                    // Obx(() => controller.selectedImagePath.value == ''
                    //     ? Text(
                    //         "select image from gallery",
                    //         style: TextStyle(fontSize: 20),
                    //       )
                    //     : Image.file(File(controller.selectedImagePath.value))),
                    // RaisedButton(onPressed: () {
                    //   controller.GetImage(ImageSource.gallery);
                    // }),
                    Text(
                      'Booking Sick Days',
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
                            'Full Name',
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
                                hint: 'Enter your first name',
                                bgColor: Colors.white70,
                                prefixIcon: Icons.person),
                            textFieldType: TextFieldType.NAME,
                            keyboardType: TextInputType.text,
                            onChanged: controller.FirstNameChanged,
                          ),
                          Text(
                            'Last Name',
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
                                hint: 'Enter your last name',
                                bgColor: Colors.white70,
                                prefixIcon: Icons.person),
                            textFieldType: TextFieldType.NAME,
                            keyboardType: TextInputType.text,
                            onChanged: controller.LastNameChanged,
                          ),
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
                          Text(
                            'Cause',
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
                                hint: 'Enter your cause',
                                bgColor: Colors.white70,
                                prefixIcon: Icons.person),
                            textFieldType: TextFieldType.USERNAME,
                            keyboardType: TextInputType.text,
                            onChanged: controller.causeChanged,
                          ),
                          Text(
                            'select file',
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
                                  hint: controller.selectedImagePath.value
                                      .split('/')
                                      .last,
                                  bgColor: Colors.white70,
                                  prefixIcon: Icons.person),
                              textFieldType: TextFieldType.NAME,
                              keyboardType: TextInputType.text,
                              readOnly: true,
                              onTap: (() => {
                                    controller.GetImage(ImageSource.gallery),
                                    print(controller.startDate),
                                  })),
                          16.height,
                          Text(
                            'Departement',
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
                                prefixIcon: Icons.manage_search,
                                bgColor: Colors.white70,
                                hint: "Select your departement"),
                            items: <String>['Web', 'Mobile', 'IA', 'IOT']
                                .map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value, style: secondaryTextStyle()),
                              );
                            }).toList(),
                            onChanged: (value) {
                              controller.dropDownValue = value.toString();
                              controller.departementChanged(value.toString());
                            },
                          ),
                          16.height,
                          Text(
                            'Chef Departement',
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
                                prefixIcon: Icons.groups,
                                bgColor: Colors.white70,
                                hint: "Select your Chef departement"),
                            items: <String>[
                              'Khalil charfi',
                              'Nour Boukettaya',
                              'Anis ghabi'
                            ].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value, style: secondaryTextStyle()),
                              );
                            }).toList(),
                            onChanged: (value) {
                              controller.dropDownValue = value.toString();
                              controller.chefChanged(value.toString());
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
                          // RaisedButton(onPressed: () {
                          //   controller.GetImage(ImageSource.gallery);
                          // }),
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
                                      print(controller.startDate),
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
                                      print(controller.enndDate),
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
                              'Reclamation',
                              style:
                                  boldTextStyle(color: Colors.white, size: 20),
                            ),
                            onTap: () {
                              controller.submitFunction();
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
