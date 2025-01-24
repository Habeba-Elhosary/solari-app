import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../values/text_styles.dart';
import '../values/colors.dart';
import '../values/fonts.dart';

class MaterialAppTheme {
  static ThemeData appTheme = ThemeData(
    useMaterial3: false,
    visualDensity: VisualDensity.standard,
    // primarySwatch: AppColors.primary.getMaterialColorFromColor(),
    // colorScheme: ColorScheme.fromSwatch(
    //   primarySwatch: AppColors.primary.getMaterialColorFromColor(),
    //   accentColor: AppColors.secondary,
    //   backgroundColor: AppColors.appBackground,
    //   brightness: Brightness.light,
    //   cardColor: AppColors.white,
    //   errorColor: AppColors.redDark,
    // ),

    scaffoldBackgroundColor: AppColors.appBackground,
    primaryColor: AppColors.primary,
    dialogBackgroundColor: AppColors.appBackground,
    primaryColorLight: AppColors.primary,
    disabledColor: AppColors.appBackground,
    fontFamily: AppFonts.fontName,
    cardTheme: CardTheme(
      color: AppColors.white,
      shadowColor: AppColors.grey,
      // elevation: Sizes.size4,
      // margin: const EdgeInsets.all(Margins.xSmall),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      enableFeedback: true,
      backgroundColor: AppColors.primary,
      elevation: 8,
      shape: CircleBorder(),
    ),

    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.primary,
      disabledColor: AppColors.greyLight,
      splashColor: AppColors.primary,
      textTheme: ButtonTextTheme.normal,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 10.sp),
        elevation: 0,
        backgroundColor: AppColors.primary,
        // textStyle: StylesManager.bold(
        //   color: AppColors.white,
        // ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.primary,
      selectedItemColor: AppColors.secondary,
      showSelectedLabels: true,
      unselectedItemColor: AppColors.grey,
      // selectedLabelStyle: StylesManager.regular(
      //   color: AppColors.secondary,
      //   // fontSize: FontSize.xXSmall,
      // ),
      // unselectedLabelStyle: StylesManager.regular(
      //   color: AppColors.grey,
      //   // fontSize: FontSize.xSmall,
      // ),
    ),
    textTheme: TextTheme(
        // displayLarge: StylesManager.medium(
        //   color: AppColors.primary,
        //   // fontSize: Sizes.size18,
        // ),
        // titleMedium: StylesManager.medium(
        //   color: AppColors.primary,
        //   // fontSize: Sizes.size16,
        // ),
        //   titleSmall: StylesManager.medium(
        //     color: AppColors.primary,
        //     // fontSize: Sizes.size14,ح
        //   ),
        //   bodySmall: StylesManager.regular(
        //     color: AppColors.primary,
        //   ),
        //   bodyLarge: StylesManager.regular(color: AppColors.primary),
        ),
    badgeTheme: const BadgeThemeData(
      backgroundColor: AppColors.red,
    ),

    // * Modified
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.appBackground,
      shadowColor: AppColors.black,
      centerTitle: true,
      iconTheme: const IconThemeData(
        color: AppColors.primary,
      ),
      titleTextStyle: TextStyles.semiBold20.copyWith(
        color: AppColors.black,
        fontFamily: AppFonts.fontName,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      alignLabelWithHint: true,
      floatingLabelStyle:
          TextStyles.regular16.copyWith(color: AppColors.greyHint),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.r),
        ),
        borderSide: BorderSide(color: AppColors.textFieldFillColor, width: 0.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.r),
        ),
        borderSide: BorderSide(color: AppColors.textFieldFillColor, width: 0.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.r),
        ),
        borderSide: const BorderSide(color: AppColors.red, width: 0.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.r),
        ),
        borderSide: BorderSide(color: AppColors.primary, width: 0.5),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.r),
        ),
        borderSide: BorderSide(color: AppColors.textFieldFillColor, width: 0.5),
      ),
      focusColor: AppColors.success,
      // errorStyle: StylesManager.regular(color: AppColors.redDark),
      labelStyle: TextStyles.regular16.copyWith(color: AppColors.greyHint),
      filled: true,
      fillColor: AppColors.white,
      isDense: true,
      contentPadding: EdgeInsets.symmetric(
        vertical: 5.sp,
        horizontal: 15.sp,
      ),
    ),
    dropdownMenuTheme: DropdownMenuThemeData(
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyles.light16.copyWith(color: AppColors.greyDark),
        isDense: true,
        labelStyle: TextStyles.regular18.copyWith(color: AppColors.white),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        alignLabelWithHint: true,
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.r)),
          borderSide: BorderSide(
            color: AppColors.textFieldFillColor,
            width: 0.5,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.r)),
          borderSide: BorderSide(color: AppColors.primary, width: 0.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.r)),
          borderSide: const BorderSide(color: AppColors.red, width: 0.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.r)),
          borderSide: BorderSide(color: AppColors.primary, width: 0.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.r)),
          borderSide: BorderSide(color: AppColors.primary, width: 0.5),
        ),
        fillColor: AppColors.textFieldFillColor,
        filled: true,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 15.sp,
          vertical: 10.sp,
        ),
      ),
    ),
  );
}
