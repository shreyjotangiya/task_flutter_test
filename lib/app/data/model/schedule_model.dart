import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_flutter_test/app/common/widgets/common_widgets.dart';
import 'package:task_flutter_test/app/utils/constants/index.dart';

class ChildModel{
  int id;
  String? timePeriodLabel;
  TimeOfDay? startTime;
  TimeOfDay? endTime;

  ChildModel({required this.endTime, required this.startTime, required this.timePeriodLabel, required this.id});

}


class BeanSchedule {

  /// Loaded List
  List<ChildModel> arrScheduleList = [

    /// Morning
    ChildModel(
      id: 0,
      endTime: const TimeOfDay(hour: 11, minute: 59),
      startTime: const TimeOfDay(hour: 0, minute: 0),
      timePeriodLabel: "Morning",
    ),


    /// Afternoon
    ChildModel(
      id: 1,
      endTime: const TimeOfDay(hour: 17, minute: 59),
      startTime: const TimeOfDay(hour: 12, minute: 0),
      timePeriodLabel: "Afternoon",
    ),


    /// Evening
    ChildModel(
      id: 2,
      endTime: const TimeOfDay(hour: 23, minute: 59),
      startTime: const TimeOfDay(hour: 18, minute: 0),
      timePeriodLabel: "Evening",
    ),

  ];


  ChildModel? isSelectTime;
  int id;

  BeanSchedule({required this.id,this.isSelectTime});

  /*Widget getLayout({required Function setState, required BuildContext context, required int index}){

    Future<void> selectTime(BuildContext context) async {

      TimeOfDay? picked12 = await showTimePicker(
        context: context,
        initialTime: arrScheduleList[index].startTime!,
        builder: (BuildContext context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child!,
          );
        },
      );

      if (picked12 != null && picked12 != arrScheduleList[index].startTime!) {
        if (picked12.hour >= 6 && picked12.hour <= 8) {
          setState(() {
            arrScheduleList[index].startTime = picked12;
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Please select a time between 6:00 AM and 8:00 PM.'),
            ),
          );
        }
      }


    }


    return Container(
      width: Get.width * .9,
      margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      padding: AppSize.getMarginAll(margin: 10),
      decoration: BoxDecoration(
        borderRadius: AppSize.getBorderRadiusCircular(doubleRadius: 10),
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
              borderRadius: AppSize.getBorderRadiusCircular(doubleRadius: 10),
              color: AppColors.whiteColor,
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<ChildModel?>(
                value: isSelectTime,
                padding: EdgeInsets.zero,
                isDense: true,
                onChanged: (ChildModel? newValue) {
                  Constants.printMessage(tag: "DropdownButton", message: newValue?.timePeriodLabel ?? "N/A");


                  setState(() {
                    isSelectTime = newValue;
                  });

                  Constants.printMessage(tag: "DropdownButton_selected",
                      message: isSelectTime?.timePeriodLabel ?? "N/A");

                },
                items: arrScheduleList.map((item) {
                  return DropdownMenuItem<ChildModel>(
                    value: item,
                    child: Text(item.timePeriodLabel ?? "N/A",
                      style: const TextStyle(color: Colors.black),),
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
              borderRadius: AppSize.getBorderRadiusCircular(doubleRadius: 10),
              color: AppColors.whiteColor,
            ),
            child:  InkWell(
              onTap: (){
                selectTime(context);
              },
              child: RichText(
                textAlign: TextAlign.center,
                text:  TextSpan(
                  text: "",
                  style: const TextStyle(
                      fontFamily: AppFontFamily.fontName,
                      fontWeight: AppFontWeight.medium,
                      color: AppColors.blackColor,
                      fontSize: AppFont.font_16
                  ),
                  children: [
                    const WidgetSpan(
                      child: Icon(Icons.watch_later_outlined,size: 16, color: AppColors.primaryColor,),
                    ),

                    TextSpan(
                        text: " | ${arrScheduleList[index].startTime!.format(context)}"
                    )

                  ],
                ),
              ),
            ),

          ),


        ],
      ),
    );
  }*/
}
