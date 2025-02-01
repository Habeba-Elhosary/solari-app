import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solari/core/constants/app_colors.dart';
import 'package:solari/core/constants/app_text_styles.dart';

void showAppSnackBar({
  required BuildContext context,
  required String message,
  required SnackBarType type,
  SnackBarBehavior? behavior = SnackBarBehavior.floating,
  Duration duration = const Duration(milliseconds: 1750),
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    buildAppSnackBar(
      context: context,
      message: message,
      type: type,
      behavior: behavior,
      duration: duration,
    ),
  );
}

SnackBar buildAppSnackBar({
  required BuildContext context,
  required String message,
  required SnackBarType type,
  required SnackBarBehavior? behavior,
  required Duration duration,
}) {
  return SnackBar(
    content: _buildContent(message, type),
    dismissDirection: DismissDirection.horizontal,
    padding: _padding,
    margin: _getMargin(context, behavior),
    backgroundColor: type.color,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.r),
    ),
    behavior: behavior,
    duration: duration,
    elevation: 0.0,
  );
}

Widget _buildContent(String message, SnackBarType type) {
  return Wrap(
    crossAxisAlignment: WrapCrossAlignment.center,
    children: <Widget>[
      Icon(
        type.icon,
        color: AppColors.white,
        size: 32.sp,
      ),
      SizedBox(width: 8.sp),
      Text(
        message,
        style: TextStyles.regular16.copyWith(color: AppColors.white),
        overflow: TextOverflow.clip,
      ),
    ],
  );
}

EdgeInsetsGeometry get _padding =>
    EdgeInsets.symmetric(horizontal: 16.sp, vertical: 8.sp);

EdgeInsetsGeometry? _getMargin(
    BuildContext context, SnackBarBehavior? behavior) {
  if (behavior != SnackBarBehavior.floating) {
    return null;
  }
  return EdgeInsetsDirectional.only(
    bottom: 16.sp,
    start: 16.sp,
    end: 16.sp,
  );
}

enum SnackBarType {
  success,
  error,
  warning,
  info,
}

extension SnackBarTypeColor on SnackBarType {
  Color get color {
    switch (this) {
      case SnackBarType.success:
        return AppColors.success;
      case SnackBarType.error:
        return AppColors.failed;
      case SnackBarType.warning:
        return AppColors.warning;
      case SnackBarType.info:
        return AppColors.info;
    }
  }

  IconData get icon {
    switch (this) {
      case SnackBarType.success:
        return Icons.check_circle_rounded;
      case SnackBarType.error:
        return Icons.close_rounded;
      case SnackBarType.warning:
        return Icons.warning_rounded;
      case SnackBarType.info:
        return Icons.info_rounded;
    }
  }
}
