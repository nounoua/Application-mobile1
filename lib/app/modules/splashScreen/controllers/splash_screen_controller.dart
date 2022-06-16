import 'package:applicationform/app/modules/home/views/home_view.dart';
import 'package:applicationform/app/modules/secondlogin/views/secondlogin_view.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashScreenController extends GetxController {
  final box = GetStorage();

  @override
  void onInit() async {
    super.onInit();
    print('nour');
    await box.writeIfNull('isLogged', true);
    if (box.read('isLogged')) {
      await Get.toNamed('/secondlogin');
    } else {
      Get.toNamed('/secondprofile');
      //  Future.delayed(const Duration(seconds: 3)).then((value) => {
      //    Get.toNamed('/secondprofile')
      //    });
    }
  }

  @override
  void onReady() async {
    super.onReady();
  }
}
