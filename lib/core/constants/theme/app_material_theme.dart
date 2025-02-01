import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solari/core/constants/app_colors.dart';
import 'package:solari/core/constants/app_fonts.dart';
import 'package:solari/core/constants/app_text_styles.dart';
import 'package:solari/core/constants/size_configuration.dart';

class AppMaterialTheme {
  static AppBarTheme appBarTheme = const AppBarTheme();

  static ElevatedButtonThemeData elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.purple,
      foregroundColor: AppColors.white,
      textStyle: TextStyles.bold14,
      elevation: 0.0,
      shape: const StadiumBorder(),
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.hPadding,
        vertical: 16.sp,
      ),
    ),
  );

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: AppFonts.roboto,
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
    textTheme: TextTheme(titleMedium: TextStyles.medium14),
    appBarTheme: appBarTheme,
    elevatedButtonTheme: elevatedButtonTheme,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: AppFonts.roboto,
    scaffoldBackgroundColor: AppColors.black,
    textTheme: TextTheme(titleMedium: TextStyles.medium14),
    appBarTheme: appBarTheme,
    elevatedButtonTheme: elevatedButtonTheme,
  );
}
