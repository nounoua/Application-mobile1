import 'package:applicationform/app/modules/Rapport/views/rapport_view.dart';
import 'package:applicationform/app/modules/calanderi/views/calanderi_view.dart';
import 'package:applicationform/app/modules/choose_material/views/choose_material_view.dart';

import 'package:applicationform/app/modules/editProfile/views/edit_profile_view.dart';

import 'package:applicationform/app/modules/reclamationSick/bindings/reclamation_binding.dart';
import 'package:applicationform/app/modules/reclamationSick/views/reclamationSick_view.dart';
import 'package:applicationform/app/modules/reservationBreak/views/reservation_break_view.dart';
import 'package:applicationform/app/modules/reservationWorkAtHome/views/reservation_work_at_home_view.dart';

import 'package:applicationform/app/modules/secondlogin/controllers/secondlogin_controller.dart';
import 'package:applicationform/app/modules/secondprofile/views/secondprofile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'package:applicationform/widget/drawer.dart';
import 'package:carousel_nullsafety/carousel_nullsafety.dart';
import 'package:applicationform/widget/custom_text.dart';
import 'package:applicationform/widget/widgets_lib.dart';

import 'package:fab_circular_menu/fab_circular_menu.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    SecondloginController logout = Get.put(SecondloginController());
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 1, 31, 77),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            iconSize: 30,
            color: Colors.white,
            onPressed: (() => {logout.logoutFunction()}),
          ),
        ],
      ),
      body: Column(children: <Widget>[
        Container(
            height: 350,
            width: double.infinity,
            child: Carousel(
              images: [
                AssetImage('assets/images/rHH.jpg'),
                AssetImage('assets/images/55.png'),
                AssetImage('assets/images/hhh.jpg'),
                AssetImage('assets/images/hr.jpg'),
                AssetImage('assets/images/rh2.jpg'),
                AssetImage('assets/images/human.jpg'),
                AssetImage('assets/images/hr2.png'),
              ],
              dotSize: 8,
              dotColor: Colors.white,
              dotIncreaseSize: 2,
              dotSpacing: 20,
              boxFit: BoxFit.cover,
              dotBgColor: Color.fromARGB(255, 1, 31, 77).withOpacity(0.7),
              noRadiusForIndicator: true,
              overlayShadow: false,
            )),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Services",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 33,
                  fontWeight: FontWeight.w900,
                  color: Color.fromARGB(255, 1, 31, 77),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 220,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                height: 140,
                width: 120,
                child: ListTile(
                  title: Image.asset(
                    'assets/images/proff.jpg',
                    width: 80,
                    height: 80,
                  ),
                  onTap: () {
                    Get.off(SecondprofileView());
                  },
                  subtitle: Container(
                      child: Text("Profile page",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w900,
                            color: Color.fromARGB(255, 1, 31, 77),
                          ))),
                ),
              ),
              // Container(
              //   height: 140,
              //   width: 120,
              //   child: ListTile(
              //     title: Image.asset(
              //       'assets/images/1000.jpg',
              //       width: 80,
              //       height: 80,
              //     ),
              //     subtitle: Container(
              //         child: Text("Booking Pages",
              //             textAlign: TextAlign.center,
              //             style: TextStyle(
              //               fontSize: 17,
              //               fontWeight: FontWeight.w900,
              //               color: Color.fromARGB(255, 1, 31, 77),
              //             ))),
              //     onTap: () {
              //       Get.to(CirculeMenuView());
              //     },
              //   ),
              // ),
              Container(
                height: 140,
                width: 100,
                child: ListTile(
                  title: Image.asset(
                    'assets/images/editt.jpg',
                    width: 80,
                    height: 80,
                  ),
                  onTap: () {
                    Get.to(() => EditprofilView());
                  },
                  subtitle: Container(
                      child: Text(
                    "Edit Profile",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w900,
                      color: Color.fromARGB(255, 1, 31, 77),
                    ),
                  )),
                ),
              ),
              Container(
                height: 140,
                width: 140,
                child: ListTile(
                  title: Image.asset(
                    'assets/images/calenddd.jpg',
                    width: 85,
                    height: 85,
                  ),
                  onTap: () {
                    Get.to(() => CalanderiView());
                  },
                  subtitle: Container(
                      child: Text(
                    "Calendar Page",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w900,
                      color: Color.fromARGB(255, 1, 31, 77),
                    ),
                  )),
                ),
              ),
              Container(
                height: 140,
                width: 100,
                child: ListTile(
                  title: Image.asset(
                    'assets/images/rep.jpg',
                    width: 80,
                    height: 80,
                  ),
                  onTap: () {
                    Get.to(() => RapportView());
                  },
                  subtitle: Container(
                      child: Text(
                    "Report Page",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w900,
                      color: Color.fromARGB(255, 1, 31, 77),
                    ),
                  )),
                ),
              ),
            ],
          ),
        ),
      ]),
      floatingActionButton: Builder(
        builder: (context) => FabCircularMenu(
          alignment: Alignment.bottomRight,
          ringColor: Color.fromARGB(255, 1, 31, 77),
          ringDiameter: 450.0,
          ringWidth: 100.0,
          fabSize: 64.0,
          fabElevation: 8.0,
          fabIconBorder: CircleBorder(),
          fabColor: Color.fromARGB(255, 1, 31, 77),
          fabOpenIcon: Icon(
            Icons.menu,
            color: Colors.orangeAccent.shade700.withOpacity(0.8),
          ),
          fabCloseIcon: Icon(
            Icons.close,
            color: Colors.orangeAccent.shade700.withOpacity(0.8),
          ),
          fabMargin: const EdgeInsets.all(16.0),
          animationDuration: const Duration(milliseconds: 800),
          animationCurve: Curves.easeInOutCirc,
          onDisplayChange: (isOpen) {
            print(isOpen);
          },
          children: <Widget>[
            RawMaterialButton(
              onPressed: () {
                //controller.fabKey.currentState!.close();
                Get.to(ReclamationSickView(),
                    binding: ReclamationSickBinding());
              },
              shape: CircleBorder(
                side: BorderSide(
                  width: 2,
                  color: Colors.orangeAccent.shade200,
                ),
              ),
              padding: const EdgeInsets.all(10.0),
              child: Icon(
                Icons.sick,
                color: Colors.orangeAccent.shade200,
              ),
            ),
            RawMaterialButton(
                onPressed: () {
                  Get.to(() => ReservationBreakView());
                },
                shape: CircleBorder(
                  side: BorderSide(
                    width: 2,
                    color: Colors.orangeAccent.shade200,
                  ),
                ),
                padding: const EdgeInsets.all(10.0),
                child: Icon(
                  Icons.free_breakfast,
                  color: Colors.orangeAccent.shade200,
                )),
            RawMaterialButton(
                onPressed: () {
                  Get.to(() => ReservationWorkAtHomeView());
                },
                shape: CircleBorder(
                  side: BorderSide(
                    width: 2,
                    color: Colors.orangeAccent.shade200,
                  ),
                ),
                padding: const EdgeInsets.all(10.0),
                child: Icon(
                  Icons.home_work,
                  color: Colors.orangeAccent.shade200,
                )),
            RawMaterialButton(
              onPressed: () {
                Get.to(() => ChooseMaterialView());
              },
              shape: CircleBorder(
                side: BorderSide(
                  width: 2,
                  color: Colors.orangeAccent.shade200,
                ),
              ),
              padding: const EdgeInsets.all(10.0),
              child: Icon(
                Icons.book_online,
                color: Colors.orangeAccent.shade200,
              ),
            )
          ],
        ),
      ),
    );
  }
}
