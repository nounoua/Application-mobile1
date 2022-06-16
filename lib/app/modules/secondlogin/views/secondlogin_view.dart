import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import '../controllers/secondlogin_controller.dart';
import 'package:applicationform/utils/WAColors.dart';
import 'package:applicationform/utils/WAWidgets.dart';

class SecondloginView extends GetView<SecondloginController> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passWordFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    SecondloginController controller = Get.put(SecondloginController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 1, 31, 77),
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              50.height,
              Text(
                "Log In",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Color.fromARGB(255, 1, 31, 77),
                ),
              ),
              Container(
                margin: EdgeInsets.all(16),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Container(
                      width: Get.width,
                      padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                      margin: EdgeInsets.only(top: 55.0),
                      decoration: boxDecorationWithShadow(
                          borderRadius: BorderRadius.circular(30),
                          backgroundColor: context.cardColor),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                50.height,
                                Text(
                                  "Email",
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
                                      bgColor: Colors.white70,
                                      hint: 'Enter your email here',
                                      prefixIcon: Icons.email_outlined),
                                  textFieldType: TextFieldType.EMAIL,
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: controller.emailChanged,
                                  focus: emailFocusNode,
                                  nextFocus: passWordFocusNode,
                                ),
                                16.height,
                                Text(
                                  "Password",
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
                                      bgColor: Colors.white70,
                                      hint: 'Enter your password here',
                                      prefixIcon: Icons.lock_outline),
                                  suffixIconColor: WAPrimaryColor,
                                  textFieldType: TextFieldType.PASSWORD,
                                  isPassword: true,
                                  keyboardType: TextInputType.visiblePassword,
                                  onChanged: controller.passwordChanged,
                                  focus: passWordFocusNode,
                                ),
                                4.width,
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text('Forgot password?',
                                      style: boldTextStyle(color: black)),
                                ),
                                30.height,
                                AppButton(
                                    text: "Log In",
                                    color: Color.fromARGB(255, 1, 31, 77),
                                    textColor: Colors.white,
                                    shapeBorder: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    width: Get.width,
                                    onTap: () {
                                      controller.submitFunction();
                                    }),
                                30.height,
                                Container(
                                  width: 200,
                                  child: Row(
                                    children: [
                                      Divider(thickness: 2).expand(),
                                      8.width,
                                      Text('or',
                                          style: boldTextStyle(
                                              size: 16, color: Colors.grey)),
                                      8.width,
                                      Divider(thickness: 2).expand(),
                                    ],
                                  ),
                                ).center(),
                                30.height,
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration:
                                          boxDecorationRoundedWithShadow(16,
                                              backgroundColor:
                                                  context.cardColor),
                                      padding: EdgeInsets.all(16),
                                      child: Image.asset(
                                          'assets/images/wa_facebook.png',
                                          width: 40,
                                          height: 40),
                                    ),
                                    30.width,
                                    Container(
                                      decoration:
                                          boxDecorationRoundedWithShadow(16,
                                              backgroundColor:
                                                  context.cardColor),
                                      padding: EdgeInsets.all(16),
                                      child: GoogleLogoWidget(size: 40),
                                    ),
                                  ],
                                ).center(),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 100,
                      width: 100,
                      decoration: boxDecorationRoundedWithShadow(30,
                          backgroundColor: context.cardColor),
                      child: Image.asset(
                        'assets/images/l2.png',
                        height: 60,
                        width: 60,
                        color: Colors.orangeAccent.shade700.withOpacity(0.8),
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
              ),
              16.height,
            ],
          ),
        ),
      ),
    );
  }
}
