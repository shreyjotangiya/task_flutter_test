import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart' hide FormData;
import 'package:task_flutter_test/app/api/api_constant.dart';
import 'package:task_flutter_test/app/common/widgets/common_widgets.dart';
import 'package:task_flutter_test/app/data/model/schedule_model.dart';

import '../../../utils/constants/index.dart';
import '../controllers/add_works_controller.dart';


class AddWorksView extends GetView<AddWorksController> {

  const AddWorksView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [


              /// static View Header...
              widgetHeader(),


              /// Main Sections...
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.dummySchedule.value.length,
                  itemBuilder: (context, index1) {
                    final item = controller.dummySchedule.value[index1].id;

                    return Dismissible(
                        key: Key(item.toString()),
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: const Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                        onDismissed: (direction) {
                          controller.dummySchedule.value.removeAt(index1);
                          controller.dummySchedule.refresh();

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('dismissed'),
                            ),
                          );
                        },
                        child: Container(
                          width: Get.width * .9,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          padding: AppSize.getMarginAll(margin: 10),
                          decoration: BoxDecoration(
                            borderRadius: AppSize.getBorderRadiusCircular(
                                doubleRadius: 10),
                            color: AppColors.greyMaterialColor.shade200,
                          ),
                          child: Row(
                            children: [

                              CommonWidgets.commonText(
                                  text: AppString.inThe,
                                  color: AppColors.greyMaterialColor,
                                  letterSpacing: .2
                              ).marginOnly(right: 10),

                              Container(
                                padding: AppSize.getMarginAll(margin: 10),
                                decoration: BoxDecoration(
                                  borderRadius: AppSize.getBorderRadiusCircular(
                                      doubleRadius: 10),
                                  color: AppColors.whiteColor,
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<ChildModel?>(
                                    value: controller.dummySchedule.value[index1].isSelectTime,
                                    padding: EdgeInsets.zero,
                                    isDense: true,
                                    onChanged: (ChildModel? newValue) {

                                      List<BeanSchedule> schedule = controller.dummySchedule.value.where((element) {
                                        return element.isSelectTime?.timePeriodLabel == newValue?.timePeriodLabel;
                                      }).toList();


                                      if (schedule.isEmpty == true) {
                                        controller.dummySchedule.value[index1].isSelectTime = newValue;
                                      }

                                      controller.dummySchedule.refresh();

                                    },
                                    items: controller.dummySchedule
                                        .value[index1].arrScheduleList.map((
                                        item) {
                                      return DropdownMenuItem<ChildModel>(
                                        value: item,
                                        child: Text(
                                          item.timePeriodLabel ?? "N/A",
                                          style: const TextStyle(
                                              color: Colors.black),),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),


                              CommonWidgets.commonText(
                                  text: AppString.at.camelCase,
                                  color: AppColors.greyMaterialColor,
                                  letterSpacing: .2
                              ).marginOnly(left: 10, right: 10),


                              Container(
                                padding: AppSize.getMarginAll(margin: 10),
                                decoration: BoxDecoration(
                                  borderRadius: AppSize.getBorderRadiusCircular(
                                      doubleRadius: 10),
                                  color: AppColors.whiteColor,
                                ),
                                child: InkWell(
                                  onTap: () async {
                                    TimeOfDay? picked12 = await showTimePicker(
                                      context: context,
                                      initialTime: controller.dummySchedule
                                          .value[index1].isSelectTime!
                                          .startTime!,
                                      builder: (BuildContext context,
                                          Widget? child) {
                                        return MediaQuery(
                                          data: MediaQuery.of(context).copyWith(
                                              alwaysUse24HourFormat: false),
                                          child: child!,
                                        );
                                      },
                                    );

                                    if (picked12 != null && picked12 !=
                                        controller.dummySchedule.value[index1]
                                            .isSelectTime!.startTime!) {
                                      if (picked12.hour >=
                                          controller.dummySchedule.value[index1]
                                              .isSelectTime!.startTime!.hour &&
                                          picked12.hour <=
                                              controller.dummySchedule
                                                  .value[index1].isSelectTime!
                                                  .endTime!.hour) {
                                        controller.dummySchedule.value[index1]
                                            .isSelectTime!.startTime = picked12;
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                'Please select a time between ${controller
                                                    .dummySchedule.value[index1]
                                                    .isSelectTime!.startTime!
                                                    .format(
                                                    context)} and ${controller
                                                    .dummySchedule.value[index1]
                                                    .isSelectTime!.endTime!
                                                    .format(context)}.'),
                                          ),
                                        );
                                      }
                                    }
                                  },
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      text: "",
                                      style: const TextStyle(
                                          fontFamily: AppFontFamily.fontName,
                                          fontWeight: AppFontWeight.medium,
                                          color: AppColors.blackColor,
                                          fontSize: AppFont.font_16
                                      ),
                                      children: [
                                        const WidgetSpan(
                                          child: Icon(
                                            Icons.watch_later_outlined,
                                            size: 16,
                                            color: AppColors.primaryColor,),
                                        ),
                                        if(controller.dummySchedule
                                            .value[index1].isSelectTime != null)
                                          TextSpan(text: " | ${controller
                                              .dummySchedule.value[index1]
                                              .isSelectTime!.startTime!.format(
                                              context)}")

                                      ],
                                    ),
                                  ),
                                ),

                              ),


                            ],
                          ),
                        ));
                  },
                ),
              ),

              if(controller.dummySchedule.value.length != 3)
                CommonWidgets.commonFilledButton(
                    context: context,
                    title: AppString.addMore,
                    textColor: AppColors.whiteColor,
                    onclick: () {
                      if (controller.dummySchedule.value.length != 3) {
                        if (controller.dummySchedule.value.isEmpty) {
                          controller.dummySchedule.value.add(BeanSchedule(
                              id: 0));
                        }
                        if (controller.dummySchedule.value.last.isSelectTime !=
                            null) {
                          controller.dummySchedule.value.add(BeanSchedule(
                              id: controller.dummySchedule.value.length));
                        }
                      }
                      controller.dummySchedule.refresh();
                    }).marginSymmetric(horizontal: Get.width * .34),

              /// get available spaces...
              const Expanded(child: SizedBox()),

              /// btn
              CommonWidgets.commonFilledButton(
                  context: context,
                  title: AppString.commonContinue,
                  textColor: AppColors.whiteColor,
                  onclick: () async {
                    if (controller.dummySchedule.value.length == 3 &&
                        controller.dummySchedule.value.last.isSelectTime
                            ?.startTime != null) {
                      await login();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              'Please select a day time [ morning | afternoon | evening ]'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  })
                  .marginSymmetric(horizontal: 20)
                  .marginOnly(
                bottom: Get.height * .025,
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget widgetHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [


        /// Header Label
        RichText(
          text: const TextSpan(
            text: "Hello",
            style: TextStyle(
                fontFamily: AppFontFamily.fontName,
                fontSize: AppFont.font_24,
                fontWeight: AppFontWeight.medium,
                color: AppColors.blackColor),
            children: <TextSpan>[
              TextSpan(
                  text: ' Aden',
                  style: TextStyle(
                      fontFamily: AppFontFamily.fontName,
                      fontSize: AppFont.font_24,
                      fontWeight: AppFontWeight.medium,
                      color: AppColors.primaryColor)),
            ],
          ),
        ).marginOnly(
          top: 30,
          left: 20,
        ),

        /// context heading
        CommonWidgets.commonText(
            text: AppString.breakTheSedentary,
            color: AppColors.greyMaterialColor,
            letterSpacing: .2)
            .marginSymmetric(horizontal: 20, vertical: 10),

        /// context
        CommonWidgets.commonText(
            text: AppString.selectWhat,
            color: AppColors.blackColor,
            letterSpacing: .2,
            fontSize: AppFont.font_16,
            fontWeight: AppFontWeight.bold)
            .marginSymmetric(horizontal: 20, vertical: 10),


      ],
    );
  }

  Future<void> login() async {
    try {
      final dio = Dio();

      String strLoginAPI = ApiConstant.baseUrl + ApiConstant.loginAPI;

      FormData formData = FormData.fromMap({
        'email': 'sdffgm@gmail.com',
        'password': 'Admin@123',
      });

      final response = await dio.post(
        strLoginAPI,
        data: formData,
        options: Options(
          headers: {'Content-Type': 'multipart/form-data'},
        ),
      );

      if (response.statusCode == 200) {
        var token = response.data["data"]["access"];

        try {
          String strUpdateAPI = ApiConstant.baseUrl + ApiConstant.updateAPI;

          List<String> arrSchedule12 = [];
          for (var object in controller.dummySchedule.value) {
            arrSchedule12.add(
                object.isSelectTime?.startTime?.format(Get.context!)
                    .toString() ?? "");
          }

          final formData = FormData.fromMap({
            'active_breaks': {
              'recommended': false,
              'breaks': arrSchedule12,
            }
          });


          final options = Options(
            headers: {
              'Content-Type': 'multipart/form-data',
              'Authorization': 'JWT $token',
            },
          );


          final response = await dio.post(
            strUpdateAPI,
            data: formData,
            options: options,
          );

          if (response.statusCode == 200) {
            ScaffoldMessenger.of(Get.context!).showSnackBar(
              SnackBar(
                content: Text(response.data["message"]),
                backgroundColor: Colors.green,
              ),
            );
          } else {

            print('Request failed with status: ${response.statusCode}');
          }
        } catch (e) {

          print('Error: $e');
        }
      } else {

        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {

      print('Error: $e');
    }
  }

}
