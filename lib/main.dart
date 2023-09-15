import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'app/utils/base/app/config_reader.dart';
import 'app/utils/constants/index.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  /// Read all config from json
  await ConfigReader.initialize();

  runApp(
    GetMaterialApp(
      title: "Task Flutter Test",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      defaultTransition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 420),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        /// use latest useMaterial3
        useMaterial3: true,
        primarySwatch: AppColors.primaryMaterialColor,

      ),
    ),
  );
}
