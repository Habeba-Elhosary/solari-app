import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solari/core/constants/app_colors.dart';
import 'package:solari/core/constants/app_fonts.dart';
import 'package:solari/core/constants/app_text_styles.dart';

class OnboardingTitle extends StatelessWidget {
  final String firstTitle;
  final String secondTitle;
  final String thirdTitle;

  const OnboardingTitle({
    super.key,
    required this.firstTitle,
    required this.secondTitle,
    required this.thirdTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: firstTitle,
            style: TextStyles.semiBold12.copyWith(
              color: AppColors.white,
              fontSize: 28.sp,
              fontFamily: AppFonts.robotoSlab,
            ),
          ),
          TextSpan(
            text: secondTitle,
            style: TextStyles.semiBold12.copyWith(
              color: AppColors.primary,
              fontSize: 28.sp,
              fontFamily: AppFonts.robotoSlab,
            ),
          ),
          TextSpan(
            text: thirdTitle,
            style: TextStyles.semiBold12.copyWith(
              color: AppColors.white,
              fontSize: 28.sp,
              fontFamily: AppFonts.robotoSlab,
            ),
          ),
        ],
      ),
    );
  }
}
