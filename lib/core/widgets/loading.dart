import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solari/core/constants/app_assets.dart';
import 'package:solari/core/constants/app_colors.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppAssets.loading,
      color: AppColors.primary,
      height: 60.h,
      width: 60.w,
    );
  }
}
