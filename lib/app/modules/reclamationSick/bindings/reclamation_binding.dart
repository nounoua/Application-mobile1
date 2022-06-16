import 'package:get/get.dart';

import '../controllers/reclamationSick_controller.dart';

class ReclamationSickBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReclamationController>(
      () => ReclamationController(),
    );
  }
}
