import 'package:get/get.dart';

import '../controllers/add_works_controller.dart';

class AddWorksBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<AddWorksController>(
      () => AddWorksController(),
    );
  }
}
