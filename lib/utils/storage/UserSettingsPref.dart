import 'package:applicationform/model/user.dart';
import 'package:get_storage/get_storage.dart';

// ignore: avoid_classes_with_only_static_members
class UserSettingsPref {
  static final appPref = GetStorage(); //pour le storage

  static String get getToken => appPref.read('token'); //pour avoir(read) token

  static void setToken(String val) => appPref.write('token', val);
  //pour ecrire token

  static UserModel get getUser => appPref.read('user');

  static void setUser(UserModel val) => appPref.write('user', val);
}
