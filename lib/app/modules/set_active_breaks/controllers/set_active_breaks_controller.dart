import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_flutter_test/app/utils/constants/app_image.dart';

class SetActiveBreaksController extends GetxController {


  /// Slider section....
  final pageControllerBanner = PageController().obs;
  final timer = Timer(const Duration(seconds: 4), () {}).obs;
  final selectedPosition = 0.obs;

  /// Temp Asset Images paths..
  final topBannerList = <String>[
    AppImages.imgSliderPng,
    AppImages.imgSliderPng,
    AppImages.imgSliderPng,
  ].obs;

  /// for selection workout
  Rx<bool> isSelectFirst = true.obs;

  @override
  void onInit() {

    /// set to auto play...
    playAuto();

    super.onInit();
  }


  void playAuto() {

    int duration = 8;

    timer.value = Timer(Duration(seconds: duration), () {
      playAuto();
      selectedPosition.value ++;
      if (selectedPosition.value == topBannerList.length) {
        selectedPosition.value = 0;
      }
      pageControllerBanner.value.animateToPage(
          selectedPosition.value, duration: const Duration(seconds: 1),
          curve: Curves.easeInOut);
    });
  }
}
