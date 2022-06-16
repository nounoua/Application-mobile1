import 'package:get/get.dart';

import '../controllers/reservation_break_controller.dart';

class ReservationBreakBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReservationBreakController>(
      () => ReservationBreakController(),
    );
  }
}
