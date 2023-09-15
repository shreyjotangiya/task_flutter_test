import 'package:get/get.dart';

import '../controllers/set_active_breaks_controller.dart';

class SetActiveBreaksBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SetActiveBreaksController>(
      () => SetActiveBreaksController(),
    );
  }
}
