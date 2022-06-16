import 'package:applicationform/utils/storage/UserSettingsPref.dart';
import 'package:applicationform/widget/drawer.dart';
import 'package:applicationform/widget/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:applicationform/utils/WAWidgets.dart';
import '../controllers/secondprofile_controller.dart';
import 'package:applicationform/model/user.dart';
import 'package:get_storage/get_storage.dart';

class SecondprofileView extends GetView<SecondprofileController> {
  TextEditingController userId = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final users = UserSettingsPref.getUser;
    print(UserSettingsPref.getUser.email);
    SecondprofileController controller = Get.put(SecondprofileController());
    return SafeArea(
      child: Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 1, 31, 77),
        ),
        body: Container(
          height: Get.height,
          width: Get.width,
          padding: EdgeInsets.only(top: 5),
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Container(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'My Profile',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          color: Color.fromARGB(255, 1, 31, 77),
                        ),
                      ),
                      // waCommonCachedNetworkImage(
                      //   users.picture!,
                      //   fit: BoxFit.cover,
                      //   height: 120,
                      //   width: 120,
                      // ).cornerRadiusWithClipRRect(60),
                      5.height,
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(
                                color: Color.fromARGB(255, 1, 31, 77),
                                width: 1)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('', style: boldTextStyle(size: 25)),
                            waCommonCachedNetworkImage(
                              'https://lh3.googleusercontent.com/-kebla9zeLHY/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucnV9gq1mHbPTOto4kj79UeWrEz1IQ/photo.jpg?sz=46',
                              fit: BoxFit.cover,
                              height: 120,
                              width: 120,
                            ).cornerRadiusWithClipRRect(60),
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
                                    hint: controller.userId.value,
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
                            Obx(() => AppTextField(
                                decoration: waInputDecoration(
                                    hint: controller.email.value,
                                    bgColor: Colors.white70,
                                    prefixIcon: Icons.email),
                                textFieldType: TextFieldType.EMAIL,
                                keyboardType: TextInputType.emailAddress,
                                onChanged: controller.emailChanged)),
                            Text(
                              'Nationality',
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
                                  hint: 'Enter your nationality',
                                  bgColor: Colors.white70,
                                  prefixIcon: Icons.translate),
                              textFieldType: TextFieldType.OTHER,
                              keyboardType: TextInputType.text,
                              onChanged: controller.nationalityChanged,
                            ),
                            Text(
                              'Number of Children',
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
                                  hint: '',
                                  bgColor: Colors.white70,
                                  prefixIcon: Icons.dialpad),
                              textFieldType: TextFieldType.PHONE,
                              keyboardType: TextInputType.number,
                              onChanged: controller.NumberChildChanged,
                            ),
                            Text(
                              'Street Address',
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
                                  hint: 'Street Address',
                                  bgColor: Colors.white70,
                                  prefixIcon: Icons.add_location_alt),
                              textFieldType: TextFieldType.OTHER,
                              keyboardType: TextInputType.text,
                              onChanged: controller.adresseChanged,
                            ),
                            Text(
                              'Favorite Color',
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
                                  hint: 'Enter your Favorite Color',
                                  bgColor: Colors.white70,
                                  prefixIcon: Icons.palette),
                              textFieldType: TextFieldType.OTHER,
                              keyboardType: TextInputType.text,
                              onChanged: controller.colorFavChanged,
                            ),
                            Text(
                              'Facebook Link',
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
                                  hint: 'Enter your Facebook Link',
                                  bgColor: Colors.white70,
                                  prefixIcon: Icons.link),
                              textFieldType: TextFieldType.URL,
                              keyboardType: TextInputType.url,
                              onChanged: controller.facebookLinkChanged,
                            ),
                            Text(
                              'Instagram Link',
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
                                  hint: 'Enter your Instagram Link',
                                  bgColor: Colors.white70,
                                  prefixIcon: Icons.link),
                              textFieldType: TextFieldType.URL,
                              keyboardType: TextInputType.url,
                              onChanged: controller.instagramLinkChanged,
                            ),
                            Text(
                              'Linkedin Link',
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
                                hint: 'Enter your Linkedin Link',
                                bgColor: Colors.white70,
                                prefixIcon: Icons.link,
                              ),
                              textFieldType: TextFieldType.URL,
                              keyboardType: TextInputType.url,
                              onChanged: controller.LinkedinChanged,
                            ),
                            16.height,
                            SettingItemWidget(
                                title: 'More Settings',
                                decoration: boxDecorationRoundedWithShadow(12,
                                    backgroundColor: context.cardColor),
                                trailing: Icon(
                                  Icons.arrow_right,
                                  color: Colors.orangeAccent.shade200,
                                ),
                                onTap: () {
                                  Get.toNamed('/edit-profile');
                                }),
                          ],
                        ),
                      ),
                      16.height,
                      AppButton(
                              color: Color.fromARGB(255, 1, 31, 77),
                              width: Get.width,
                              child: Text(
                                'Submit',
                                style: boldTextStyle(
                                    color: Colors.white, size: 20),
                              ),
                              onTap: () {
                                controller.SubmitFunction();
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
      ),
    );
  }
}
