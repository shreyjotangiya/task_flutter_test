
import 'package:get/get.dart';
import 'package:task_flutter_test/app/data/model/schedule_model.dart';


class AddWorksController extends GetxController {
  RxList<BeanSchedule> dummySchedule = <BeanSchedule>[].obs;

  @override
  void onInit() {
    dummySchedule.value.add(BeanSchedule(id: 0));
    super.onInit();
  }

}
