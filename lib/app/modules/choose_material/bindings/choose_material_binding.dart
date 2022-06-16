import 'package:get/get.dart';

import '../controllers/choose_material_controller.dart';

class ChooseMaterialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChooseMaterialController>(
      () => ChooseMaterialController(),
    );
  }
}
