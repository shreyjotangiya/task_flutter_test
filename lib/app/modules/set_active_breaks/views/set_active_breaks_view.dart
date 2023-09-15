import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:task_flutter_test/app/common/widgets/common_widgets.dart';
import 'package:task_flutter_test/app/routes/app_pages.dart';

import '../../../utils/constants/index.dart';
import '../controllers/set_active_breaks_controller.dart';

class SetActiveBreaksView extends GetView<SetActiveBreaksController> {

  const SetActiveBreaksView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            /// Header Label
            RichText(
              text: const TextSpan(
                text: "Set your",
                style: TextStyle(
                    fontFamily: AppFontFamily.fontName,
                    fontSize: AppFont.font_24,
                    fontWeight: AppFontWeight.medium,
                    color: AppColors.blackColor
                ),
                children: <TextSpan>[
                  TextSpan(text: ' Active Breaks', style: TextStyle(
                      fontFamily: AppFontFamily.fontName,
                      fontSize: AppFont.font_24,
                      fontWeight: AppFontWeight.medium,
                      color: AppColors.primaryColor
                  )),
                ],
              ),
            ).marginOnly(top: 30),


            /// context heading
            CommonWidgets.commonText(text: AppString.breakTheSedentary,
                color: AppColors.greyMaterialColor,
                letterSpacing: .2).marginSymmetric(
                horizontal: 20, vertical: 10),


            /// Main Slider
            mainSlider(sliderHeight: Get.width * .36),


            /// context heading
            CommonWidgets.commonText(text: AppString.activeBreak,
                color: AppColors.greyMaterialColor,
                textAlign: TextAlign.center,
                fontSize: AppFont.font_16,
                letterSpacing: .2).marginSymmetric(
                horizontal: 20, vertical: 10),


            Obx(() {
              return Row(
                children: [

                  /// Left Box
                  Expanded(
                    child: InkWell(
                      radius: 25,
                      splashColor: AppColors.blackColor.withOpacity(.8),
                      focusColor: AppColors.blackColor.withOpacity(.8),
                      borderRadius: AppSize.getBorderRadiusCircular(
                          doubleRadius: 25),
                      onTap: () => controller.isSelectFirst.value = true,
                      child: singleItemBox(
                        headLabel: AppString.recommendation,
                        subLabel: AppString.onePerDay,
                        borderColor: controller.isSelectFirst.value ? AppColors.primaryColor : AppColors.transparentColor,
                        labelColor: controller.isSelectFirst.value ? Colors.blueGrey.shade500 : Colors.blueGrey.shade200,
                      ),
                    ).marginOnly(left: 10, top: 10, bottom: 10),
                  ),

                  /// Right Box
                  Expanded(
                    child: InkWell(
                      radius: 25,
                      splashColor: AppColors.blackColor.withOpacity(.8),
                      focusColor: AppColors.blackColor.withOpacity(.8),
                      borderRadius: AppSize.getBorderRadiusCircular(
                          doubleRadius: 25),
                      onTap: () => controller.isSelectFirst.value = false,
                      child: singleItemBox(
                          headLabel: AppString.decide,
                          subLabel: AppString.hereYour,
                          borderColor: !controller.isSelectFirst.value ? AppColors.primaryColor : AppColors.transparentColor,
                          labelColor: !controller.isSelectFirst.value ? Colors.blueGrey.shade500 : Colors.blueGrey.shade200,
                      ),
                    ).marginOnly(left: 10, top: 10, bottom: 10),
                  ),

                ],
              );
            }).marginSymmetric(horizontal: 10),

            /// Expended -> Row end


            /// get available spaces...
            const Expanded(child: SizedBox()),

            /// btn
            CommonWidgets.commonFilledButton(
                context: context,
                title: AppString.commonContinue,
                textColor: AppColors.whiteColor,
              onclick: (){
                  Get.toNamed(Routes.ADD_WORKS);
              }
            ).marginSymmetric(horizontal: 20)
                .marginOnly(bottom: Get.height * .025,),

          ],
        ),
      ),
    );
  }

  Widget singleItemBox({
    required Color borderColor,
    required Color labelColor,
    required String headLabel,
    required String subLabel}) {

    return Container(
      height: Get.height * .14,
      padding: AppSize.getMarginSymmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: AppSize.getBorderRadiusCircular(doubleRadius: 10),
        color: AppColors.greyMaterialColor.shade200,
        border: Border.all(color: borderColor, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [



          Container(
            padding: AppSize.getMarginSymmetric(vertical: 3),
            margin: AppSize.getMarginSymmetric(vertical: 3,horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: AppSize.getBorderRadiusCircular(doubleRadius: 10),
              color: labelColor),
              child: Center(
                  child: Text(
                      headLabel,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: AppColors.whiteColor),
                  ),
              ),
          ),




          Text(
            subLabel,
            textAlign: TextAlign.center,
          ),



        ],
      ),
    );
  }


  Widget mainSlider({required double sliderHeight}) {


    return SizedBox(
      width: Get.width * .9,
      height: sliderHeight + 100,
      child: Column(
        children: [

          /// Slider
          Expanded(
            child: ClipRRect(
              borderRadius: AppSize.getBorderRadiusAll(doubleRadius: 10),
              child: Obx(
                    () =>
                    PageView.builder(
                        allowImplicitScrolling: true,
                        scrollDirection: Axis.horizontal,
                        controller: controller.pageControllerBanner.value,
                        onPageChanged: (int page) {
                          controller
                              .selectedPosition.value = page;
                        },
                        itemCount: controller.topBannerList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Image.asset(
                              controller.topBannerList[index],
                              fit: BoxFit.cover);
                        }),
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Obx(() {
                return Container(
                  height: 8.00,
                  margin: AppSize.getMarginOnly(top: 10),
                  child: AnimatedSmoothIndicator(
                    activeIndex: controller.selectedPosition.value,
                    count: controller.topBannerList.length,
                    axisDirection: Axis.horizontal,
                    effect: const ScrollingDotsEffect(
                        spacing: 4,
                        activeDotColor: AppColors.primaryColor,
                        dotColor: AppColors.greyMaterialColor,
                        dotHeight: 5.00,
                        dotWidth: 12.00),
                  ),
                );
              }),
            ],
          )

        ],
      ),
    );
  }
}


