import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solari/core/constants/app_colors.dart';
import 'package:solari/core/constants/app_fonts.dart';
import 'package:solari/core/constants/app_text_styles.dart';
import 'package:solari/core/constants/size_configuration.dart';

class AppMaterialTheme {
  static AppBarTheme appBarTheme = AppBarTheme(
    backgroundColor: AppColors.white,
    elevation: 0.0,
    titleTextStyle: TextStyles.bold16,
    centerTitle: true,
  );

  static ElevatedButtonThemeData elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      disabledBackgroundColor: AppColors.greyLight,
      disabledForegroundColor: AppColors.white,
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.white,
      textStyle: TextStyles.bold16,
      elevation: 0.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.hPadding,
        vertical: 16.sp,
      ),
    ),
  );

  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    disabledBorder: InputBorder.none,
    floatingLabelStyle: TextStyles.regular14.copyWith(color: AppColors.primary),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.r),
      borderSide: BorderSide(color: AppColors.red),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.r),
      borderSide: BorderSide(color: AppColors.red),
    ),
    filled: true,
    fillColor: AppColors.white,
    floatingLabelAlignment: FloatingLabelAlignment.start,
    contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    labelStyle: TextStyles.regular14,
    errorStyle: TextStyles.regular12.copyWith(color: AppColors.red),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.r),
      borderSide: BorderSide(color: AppColors.primary, width: 1.sp),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.r),
      borderSide: BorderSide(color: AppColors.greyLight, width: 1.sp),
    ),
  );

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    actionIconTheme: ActionIconThemeData(
      backButtonIconBuilder: (context) {
        return Icon(
          Icons.arrow_back_rounded,
          color: AppColors.primary,
          size: 24.sp,
        );
      },
    ),
    fontFamily: AppFonts.roboto,
    scaffoldBackgroundColor: AppColors.white,
    textTheme: TextTheme(titleMedium: TextStyles.medium14),
    appBarTheme: appBarTheme,
    inputDecorationTheme: inputDecorationTheme,
    elevatedButtonTheme: elevatedButtonTheme,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: AppFonts.roboto,
    scaffoldBackgroundColor: AppColors.black,
    textTheme: TextTheme(titleMedium: TextStyles.medium14),
    appBarTheme: appBarTheme,
    elevatedButtonTheme: elevatedButtonTheme,
    inputDecorationTheme: inputDecorationTheme,
  );
}
