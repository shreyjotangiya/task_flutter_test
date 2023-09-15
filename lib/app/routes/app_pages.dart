import 'package:get/get.dart';

import '../modules/add_works/bindings/add_works_binding.dart';
import '../modules/add_works/views/add_works_view.dart';
import '../modules/set_active_breaks/bindings/set_active_breaks_binding.dart';
import '../modules/set_active_breaks/views/set_active_breaks_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SET_ACTIVE_BREAKS;

  static final routes = [
    GetPage(
      name: _Paths.ADD_WORKS,
      page: () =>  AddWorksView(),
      binding: AddWorksBinding(),
    ),
    GetPage(
      name: _Paths.SET_ACTIVE_BREAKS,
      page: () => const SetActiveBreaksView(),
      binding: SetActiveBreaksBinding(),
    ),
  ];
}
