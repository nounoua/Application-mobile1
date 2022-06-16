import 'package:applicationform/utils/WAWidgets.dart';
import 'package:applicationform/widget/drawer.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../controllers/rapport_controller.dart';

class RapportView extends GetView<RapportController> {
  @override
  TextEditingController userId = TextEditingController();
  @override
  Widget build(BuildContext context) {
    RapportController controller = Get.put(RapportController());
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 1, 31, 77),
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      ' Make a Report',
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
                                // hint: controller.userid!,
                                hint: '5c2f1915-3db3-48b7-9089-40feda8f2580',
                                bgColor: Colors.white70,
                                prefixIcon: Icons.fingerprint),
                            textFieldType: TextFieldType.NAME,
                            keyboardType: TextInputType.name,
                            // controller: fullNameController,
                            //focus: fullNameFocusNode,
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
                              controller.departementChanged(value.toString());
                            },
                          ),
                          16.height,
                          Text(
                            'Problem',
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
                                hint: "Select your Problem"),
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
                              controller.problemChanged(value.toString());
                            },
                          ),
                          Text(
                            'Description',
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
                                hint: 'Enter your description',
                                bgColor: Colors.white70,
                                prefixIcon: Icons.description),
                            textFieldType: TextFieldType.OTHER,
                            keyboardType: TextInputType.text,
                            onChanged: controller.descChanged,
                          ),
                        ],
                      ),
                    ),
                    16.height,
                    AppButton(
                            color: Color.fromARGB(255, 1, 31, 77),
                            width: Get.width,
                            child: Text(
                              'Report',
                              style:
                                  boldTextStyle(color: Colors.white, size: 15),
                            ),
                            onTap: () {
                              controller.Repport();
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
