import 'package:applicationform/utils/WAWidgets.dart';
import 'package:applicationform/widget/drawer.dart';
import 'package:applicationform/widget/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import '../controllers/annonce_controller.dart';
import 'package:rounded_expansion_tile/rounded_expansion_tile.dart';

class AnnonceView extends GetView<AnnonceController> {
  @override
  Widget build(BuildContext context) {
    AnnonceController controller = Get.put(AnnonceController());
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 1, 31, 77),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        children: [
          Card(
            color: Colors.orangeAccent.shade700.withOpacity(0.7),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
            child: RoundedExpansionTile(
              focusColor: Colors.green,
              leading: Icon(Icons.cake),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28)),
              title: Text('Birthday Celebration'),
              noTrailing: true,
              children: [
                ListTile(
                  title: Image.asset(
                    'assets/images/birthh.jpg',
                    width: 850,
                    height: 330,
                  ),
                  subtitle: Container(
                      child: Text(
                    "happy birthday, I wish you a lot of happiness",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w900,
                      color: Colors.black.withOpacity(0.8),
                    ),
                  )),
                ),
                Obx(
                  () => AppTextField(
                      decoration: waInputDecoration(
                          // bgColor: Colors.white70,
                          hint: DateFormat()
                              .add_yMd()
                              .format(controller.selectedDate.value),
                          prefixIcon: Icons.calendar_today),
                      textFieldType: TextFieldType.OTHER,
                      keyboardType: TextInputType.datetime,
                      // onChanged:controller.jourChanged();
                      onTap: (() => {
                            controller.jourChanged(),
                          })),
                )
              ],
            ),
          ),
          Divider(height: 20),
          Card(
            color: Colors.orangeAccent.shade100,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
            child: RoundedExpansionTile(
              focusColor: Colors.red,
              leading: Icon(Icons.liquor),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28)),
              title: Text('Wedding Party'),
              trailing: Icon(Icons.keyboard_arrow_down),
              rotateTrailing: true,
              children: [
                ListTile(
                  title: Image.asset(
                    'assets/images/marry.jpg',
                    width: 850,
                    height: 200,
                  ),
                  subtitle: Container(
                      child: Text(
                    "Happy Wedding Day Lovers",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                  )),
                )
              ],
            ),
          ),
          Divider(height: 20),
          Card(
            color: Colors.orangeAccent.shade200.withOpacity(0.5),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
            child: RoundedExpansionTile(
              focusColor: Colors.green,
              leading: Icon(Icons.sick),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28)),
              title: Text('Sick Days'),
              trailing: Icon(Icons.info_outline),
              rotateTrailing: false,
              children: [
                ListTile(
                  title: Image.asset(
                    'assets/images/siii.jpg',
                    width: 850,
                    height: 200,
                  ),
                  subtitle: Container(
                      child: Text(
                    "I wish a speedy recovery",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w900,
                      color: Colors.black.withOpacity(0.8),
                    ),
                  )),
                )
              ],
            ),
          ),
          Divider(height: 20),
          Card(
            color: Colors.orangeAccent.shade700.withOpacity(0.8),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
            child: RoundedExpansionTile(
              leading: Icon(Icons.coffee),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28)),
              title: Text('Breaks'),
              trailing: Icon(Icons.keyboard_arrow_down),
              rotateTrailing: true,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: (

                        // Text('Start Date', style: boldTextStyle(size: 15)),

                        Obx(
                      () => AppTextField(
                          decoration: waInputDecoration(
                              // bgColor: Colors.white70,
                              hint: DateFormat()
                                  .add_yMd()
                                  .format(controller.selectedDate.value),
                              prefixIcon: Icons.calendar_today),
                          textFieldType: TextFieldType.OTHER,
                          keyboardType: TextInputType.datetime,
                          // onChanged:controller.jourChanged();
                          onTap: (() => {
                                controller.jourChanged(),
                              })),
                    )),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
