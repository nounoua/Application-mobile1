import 'package:get/get.dart';

import '../controllers/secondlogin_controller.dart';

class SecondloginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SecondloginController>(
      () => SecondloginController(),
    );
  }
}
