import 'package:applicationform/app/modules/editProfile/controllers/edit_profile_controller.dart';
import 'package:applicationform/app/modules/secondprofile/views/secondprofile_view.dart';
import 'package:applicationform/widget/drawer.dart';
import 'package:flutter/material.dart';
import 'package:applicationform/utils/WAWidgets.dart';
import 'package:applicationform/utils/WAColors.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:applicationform/utils/storage/UserSettingsPref.dart';
import 'package:applicationform/model/user.dart';
import 'package:get_storage/get_storage.dart';

class EditprofilView extends GetView<EditProfileController> {
  TextEditingController userId = TextEditingController();

  @override
  Widget build(BuildContext context) {
    EditProfileController controller = Get.put(EditProfileController());
    return SafeArea(
      child: Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 1, 31, 77),
        ),
        body: Container(
          height: Get.height,
          width: Get.width,
          padding: EdgeInsets.only(top: 0),
          // decoration: BoxDecoration(
          //     image: DecorationImage(
          //         image: AssetImage('assets/images/o.jpg'), fit: BoxFit.cover)),
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Container(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'More Settings',
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
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                                color: Color.fromARGB(255, 1, 31, 77),
                                width: 1)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'User Id',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
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
                                prefixIcon: Icons.fingerprint,
                              ),
                              textFieldType: TextFieldType.NAME,
                              keyboardType: TextInputType.name,
                              // controller: fullNameController,
                              //focus: fullNameFocusNode,
                            ),
                            Text(
                              'First Name',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
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
                              textFieldType: TextFieldType.OTHER,
                              keyboardType: TextInputType.text,
                              onChanged: controller.fnameChanged,
                            ),
                            16.height,
                            Text(
                              'Date of birth',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
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
                                          .format(controller.dateBirth.value),
                                      prefixIcon: Icons.calendar_today),
                                  textFieldType: TextFieldType.OTHER,
                                  keyboardType: TextInputType.datetime,
                                  // onChanged:controller.jourChanged();
                                  onTap: (() => {
                                        controller.DateBirthChanged(),
                                      })),
                            ),
                            Text(
                              'Partner Name',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                color: Color.fromARGB(255, 1, 31, 77),
                              ),
                            ),
                            8.height,
                            AppTextField(
                              decoration: waInputDecoration(
                                  hint: 'Enter your Partner Name',
                                  bgColor: Colors.white70,
                                  prefixIcon: Icons.person),
                              textFieldType: TextFieldType.URL,
                              keyboardType: TextInputType.url,
                              onChanged: controller.partnerNameChanged,
                            ),
                            16.height,
                            Text(
                              'Marriage Date',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                color: Color.fromARGB(255, 1, 31, 77),
                              ),
                            ),
                            8.height,
                            Obx(
                              () => AppTextField(
                                  decoration: waInputDecoration(
                                      bgColor: Colors.white70,
                                      hint: DateFormat().add_yMd().format(
                                          controller.marriageDate.value),
                                      prefixIcon: Icons.calendar_today),
                                  textFieldType: TextFieldType.OTHER,
                                  keyboardType: TextInputType.datetime,
                                  // onChanged:controller.jourChanged();
                                  onTap: (() => {
                                        controller.MarriageDateChanged(),
                                      })),
                            ),
                            16.height,
                          ],
                        ),
                      ),
                      16.height,
                      AppButton(
                              color: Color.fromARGB(255, 1, 31, 77),
                              width: Get.width,
                              child: Text(
                                'Add Settings ',
                                style: boldTextStyle(
                                    color: Colors.white, size: 20),
                              ),
                              onTap: () {
                                controller.SubmitFunction();
                                //Get.to(SecondprofileView());
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
      ),
    );
  }
}
