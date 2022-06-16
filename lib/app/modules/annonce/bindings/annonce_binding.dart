import 'package:get/get.dart';

import '../controllers/annonce_controller.dart';

class AnnonceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnnonceController>(
      () => AnnonceController(),
    );
  }
}
