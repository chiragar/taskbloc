import 'package:flutter/material.dart';
import 'package:task/core/constant/app_textstyle.dart';

import '../constant/app_colors.dart';

class Themes {
  static final light = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.all(Colors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return AppColor.btnColor;
          }
          return Colors.white;
        }),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.white),
          backgroundColor: MaterialStateProperty.all(AppColor.btnColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.txtBorderColor),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.txtBorderColor),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          contentPadding: const EdgeInsets.all(8),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: AppColor.txtBorderColor),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: AppColor.errorColor),
          ),
          errorStyle: AppTextstyle.ts14(
              color: AppColor.errorColor, fontWeight: FontWeight.w400),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.errorColor),
              borderRadius: BorderRadius.all(Radius.elliptical(10, 10))),
          hintStyle: AppTextstyle.ts14(
              fontWeight: FontWeight.w400, color: AppColor.hintTextColor)),
      appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white),
          actionsIconTheme: IconThemeData(color: Colors.white),
          backgroundColor: AppColor.appBarColor,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 18)));
}
