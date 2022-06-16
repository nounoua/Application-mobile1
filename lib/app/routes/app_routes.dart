part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const HOME = _Paths.HOME;
  static const LOGIN = _Paths.LOGIN;

  static const PROFILE = _Paths.PROFILE;
  static const RECLAMATION = _Paths.RECLAMATION;
  static const RESERVE = _Paths.RESERVE;
  static const MATERIAL_RESERVED = _Paths.MATERIAL_RESERVED;
  static const SECONDLOGIN = _Paths.SECONDLOGIN;
  static const SECONDPROFILE = _Paths.SECONDPROFILE;
  static const EDIT_PROFILE = _Paths.EDIT_PROFILE;
  static const CHOOSE_MATERIAL = _Paths.CHOOSE_MATERIAL;
  static const CHAT = _Paths.CHAT;
  static const CALANDERI = _Paths.CALANDERI;
  static const RESERVATION_BREAK = _Paths.RESERVATION_BREAK;
  static const RESERVATION_WORK_AT_HOME = _Paths.RESERVATION_WORK_AT_HOME;
  static const CIRCULE_MENU = _Paths.CIRCULE_MENU;
  static const RAPPORT = _Paths.RAPPORT;
  static const ANNONCE = _Paths.ANNONCE;
  static const SPLASH_SCREEN = _Paths.SPLASH_SCREEN;
}

abstract class _Paths {
  static const HOME = '/home';
  static const LOGIN = '/login';

  static const PROFILE = '/profile';
  static const RECLAMATION = '/reclamation';
  static const RESERVE = '/reserve';
  static const MATERIAL_RESERVED = '/material-reserved';
  static const SECONDLOGIN = '/secondlogin';
  static const SECONDPROFILE = '/secondprofile';
  static const EDIT_PROFILE = '/edit-profile';
  static const CHOOSE_MATERIAL = '/choose-material';
  static const CHAT = '/chat';
  static const CALANDERI = '/calanderi';
  static const RESERVATION_BREAK = '/reservation-break';
  static const RESERVATION_WORK_AT_HOME = '/reservation-work-at-home';
  static const CIRCULE_MENU = '/circule-menu';
  static const RAPPORT = '/rapport';
  static const ANNONCE = '/annonce';
  static const SPLASH_SCREEN = '/splash-screen';
}
