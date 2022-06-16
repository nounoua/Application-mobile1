import 'package:get/get.dart';

import '../controllers/secondprofile_controller.dart';

class SecondprofileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SecondprofileController>(
      () => SecondprofileController(),
    );
  }
}
