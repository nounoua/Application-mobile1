import 'package:get/get.dart';

import '../controllers/calanderi_controller.dart';

class CalanderiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CalanderiController>(
      () => CalanderiController(),
    );
  }
}
