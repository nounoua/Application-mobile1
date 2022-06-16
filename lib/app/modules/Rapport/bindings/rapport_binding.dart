import 'package:get/get.dart';

import '../controllers/rapport_controller.dart';

class RapportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RapportController>(
      () => RapportController(),
    );
  }
}
