
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:task_flutter_test/app/common/methods/common_methods.dart';

import '../../utils/constants/index.dart';

class CommonWidgets {


  static Widget commonText({
    Color? color = Colors.black,
    double? fontSize,
    double? height,
    String? text,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    int? maxLine = 3,
    double? letterSpacing,
    String fontFamily = AppFontFamily.fontName,
    TextDecoration textDecoration = TextDecoration.none,
  }) {
    return Text(
      text ?? "",
      maxLines: maxLine,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        decoration: textDecoration,
        fontSize: fontSize,
        height: height,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        overflow: TextOverflow.ellipsis
      ),
    );
  }

  static Widget commonFilledButton({
    required BuildContext? context,
    required String title,
    Color? color = AppColors.primaryColor,
    Color? textColor = AppColors.whiteColor,
    Color borderColor = Colors.transparent,
    double? fontSize = 14,
    String? text,
    double? topPadding,
    FontWeight? fontWeight = AppFontWeight.bold,
    void Function()? onclick,
  }) {
    return GestureDetector(
      onTap: () {
        onclick?.call();
        CommonMethods().hideKeyboard(context!);
      },
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
            color: borderColor,
            width: borderColor == Colors.transparent ? 0 : 1,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                color: textColor,
                fontSize: fontSize,
                height: 1.0,
                fontWeight: fontWeight,
                overflow: TextOverflow.ellipsis),
          ),
        ),
      ),
    );
  }

}
