import 'package:get/get.dart';

import '../controllers/reservation_work_at_home_controller.dart';

class ReservationWorkAtHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReservationWorkAtHomeController>(
      () => ReservationWorkAtHomeController(),
    );
  }
}
