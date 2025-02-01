import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solari/core/constants/app_colors.dart';

class AppDialogs {
  static void showAppSheet(BuildContext context, Widget child) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(40.r))),
      builder: (BuildContext context) {
        final double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
        return Padding(
          padding: EdgeInsets.only(bottom: keyboardHeight),
          child: child,
        );
      },
    );
  }

  static Future<void> showAppDialog(
    BuildContext context,
    Widget child, {
    bool? isDismissible,
  }) async {
    showAdaptiveDialog(
      context: context,
      barrierDismissible: isDismissible ?? true,
      builder: (
        BuildContext context,
      ) =>
          BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.sp, vertical: 20.sp),
          child: Material(
            type: MaterialType.transparency,
            child: Center(
              child: SafeArea(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.sp, vertical: 15.sp),
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  static void showAppGiftDialog(BuildContext context, Widget child) {
    showAdaptiveDialog(
      context: context,
      barrierDismissible: true,
      builder: (
        BuildContext context,
      ) =>
          BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Material(
          type: MaterialType.transparency,
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}
