import 'package:applicationform/widget/drawer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:applicationform/widget/inputDeco.dart';
import 'package:flutter/widgets.dart';
import 'package:applicationform/utils/WAWidgets.dart';
import 'package:applicationform/utils/storage/UserSettingsPref.dart';
import 'package:get/get.dart';
import '../controllers/reservation_work_at_home_controller.dart';

class ReservationWorkAtHomeView
    extends GetView<ReservationWorkAtHomeController> {
  TextEditingController userId = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ReservationWorkAtHomeController controller =
        Get.put(ReservationWorkAtHomeController());
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
                      'Booking to Work At home',
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
                          AppTextField(
                            decoration: waInputDecoration(
                                //hint: controller.userid!,
                                hint: '5c2f1915-3db3-48b7-9089-40feda8f2580',
                                bgColor: Colors.white70,
                                prefixIcon: Icons.fingerprint),
                            textFieldType: TextFieldType.NAME,
                            keyboardType: TextInputType.name,
                            // controller: fullNameController,
                            //focus: fullNameFocusNode,
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
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: Text(value, style: secondaryTextStyle()),
                              );
                            }).toList(),
                            onChanged: (value) {
                              //controller.dropDownValue = value.toString();
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
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: Text(value, style: secondaryTextStyle()),
                              );
                            }).toList(),
                            onChanged: (value) {
                              //controller.dropDownValue = value.toString();
                              controller.chefChanged(value.toString());
                            },
                          ),
                          Text(
                            'Describe Why',
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
                                hint: 'describe',
                                bgColor: Colors.white70,
                                prefixIcon:
                                    Icons.format_list_numbered_rtl_rounded),
                            textFieldType: TextFieldType.OTHER,
                            keyboardType: TextInputType.text,
                            onChanged: controller.descChanged,
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
                              'Submit',
                              style:
                                  boldTextStyle(color: Colors.white, size: 20),
                            ),
                            onTap: () {
                              controller.submitFunction();
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
