import 'package:applicationform/app/modules/Rapport/views/rapport_view.dart';
import 'package:applicationform/app/modules/annonce/views/annonce_view.dart';
import 'package:applicationform/app/modules/calanderi/views/calanderi_view.dart';
import 'package:applicationform/app/modules/editProfile/views/edit_profile_view.dart';
import 'package:applicationform/app/modules/home/views/home_view.dart';

import 'package:applicationform/app/modules/reclamationSick/views/reclamationSick_view.dart';
import 'package:applicationform/app/modules/reservationBreak/views/reservation_break_view.dart';
import 'package:applicationform/app/modules/reservationWorkAtHome/views/reservation_work_at_home_view.dart';

import 'package:applicationform/app/modules/secondprofile/views/secondprofile_view.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          Divider(
            color: Colors.black,
          ),
          _createDrawerItem(
            icon: Icons.home,
            text: 'Home',
            onTap: () {
              Get.to(HomeView());
            },
          ),
          _createDrawerItem(
            icon: Icons.portrait,
            text: 'Profile Page',
            onTap: () {
              Get.to(SecondprofileView());
            },
          ),
          _createDrawerItem(
            icon: Icons.support_agent,
            text: 'Edit Profile Page',
            onTap: () {
              Get.to(EditprofilView());
            },
          ),
          _createDrawerItem(
            icon: Icons.calendar_month_sharp,
            text: 'Calendar',
            onTap: () {
              Get.to(CalanderiView());
            },
          ),
          _createDrawerItem(
            icon: Icons.report,
            text: 'Report',
            onTap: () {
              Get.to(RapportView());
            },
          ),
          _createDrawerItem(
            icon: Icons.announcement,
            text: 'Announcement',
            onTap: () {
              Get.to(AnnonceView());
            },
          ),
          Divider(
            color: Colors.orangeAccent.shade200,
            height: 30,
          ),
        ],
      ),
    );
  }

  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                scale: 1,
                fit: BoxFit.fill,
                image: AssetImage(
                  'assets/images/hhh.jpg',
                ))),
        child: Stack(children: <Widget>[]));
  }

  Widget _createDrawerItem(
      {required IconData icon,
      required String text,
      required GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Colors.orangeAccent.shade700.withOpacity(0.8),
            size: 25,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              text,
              style: TextStyle(
                color: Color.fromARGB(255, 1, 31, 77),
                fontSize: 18,
              ),
            ),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
