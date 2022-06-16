import 'package:get/get.dart';

import 'package:applicationform/app/modules/Rapport/bindings/rapport_binding.dart';
import 'package:applicationform/app/modules/Rapport/views/rapport_view.dart';
import 'package:applicationform/app/modules/annonce/bindings/annonce_binding.dart';
import 'package:applicationform/app/modules/annonce/views/annonce_view.dart';
import 'package:applicationform/app/modules/calanderi/bindings/calanderi_binding.dart';
import 'package:applicationform/app/modules/calanderi/views/calanderi_view.dart';

import 'package:applicationform/app/modules/editProfile/bindings/edit_profile_binding.dart';
import 'package:applicationform/app/modules/editProfile/views/edit_profile_view.dart';
import 'package:applicationform/app/modules/home/bindings/home_binding.dart';
import 'package:applicationform/app/modules/home/views/home_view.dart';

import 'package:applicationform/app/modules/reclamationSick/bindings/reclamation_binding.dart';
import 'package:applicationform/app/modules/reclamationSick/views/reclamationSick_view.dart';
import 'package:applicationform/app/modules/reservationBreak/bindings/reservation_break_binding.dart';
import 'package:applicationform/app/modules/reservationBreak/views/reservation_break_view.dart';
import 'package:applicationform/app/modules/reservationWorkAtHome/bindings/reservation_work_at_home_binding.dart';
import 'package:applicationform/app/modules/reservationWorkAtHome/views/reservation_work_at_home_view.dart';

import 'package:applicationform/app/modules/secondlogin/bindings/secondlogin_binding.dart';
import 'package:applicationform/app/modules/secondlogin/views/secondlogin_view.dart';
import 'package:applicationform/app/modules/secondprofile/bindings/secondprofile_binding.dart';
import 'package:applicationform/app/modules/secondprofile/views/secondprofile_view.dart';
import 'package:applicationform/app/modules/splashScreen/bindings/splash_screen_binding.dart';
import 'package:applicationform/app/modules/splashScreen/views/splash_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  //static const INITIAL = Routes.HOME;
  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.RECLAMATION,
      page: () => ReclamationSickView(),
      binding: ReclamationSickBinding(),
    ),
    GetPage(
      name: _Paths.SECONDLOGIN,
      page: () => SecondloginView(),
      binding: SecondloginBinding(),
    ),
    GetPage(
      name: _Paths.SECONDPROFILE,
      page: () => SecondprofileView(),
      binding: SecondprofileBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => EditprofilView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.CALANDERI,
      page: () => CalanderiView(),
      binding: CalanderiBinding(),
    ),
    GetPage(
      name: _Paths.RESERVATION_BREAK,
      page: () => ReservationBreakView(),
      binding: ReservationBreakBinding(),
    ),
    GetPage(
      name: _Paths.RESERVATION_WORK_AT_HOME,
      page: () => ReservationWorkAtHomeView(),
      binding: ReservationWorkAtHomeBinding(),
    ),
    GetPage(
      name: _Paths.RAPPORT,
      page: () => RapportView(),
      binding: RapportBinding(),
    ),
    GetPage(
      name: _Paths.ANNONCE,
      page: () => AnnonceView(),
      binding: AnnonceBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
  ];
}
