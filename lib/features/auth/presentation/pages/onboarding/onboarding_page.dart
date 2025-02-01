import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solari/core/constants/app_colors.dart';
import 'package:solari/core/constants/app_fonts.dart';
import 'package:solari/core/constants/app_text_styles.dart';
import 'package:solari/core/constants/size_configuration.dart';

class OnboardingPage extends StatelessWidget {
  final String firstTitle;
  final String secondTitle;
  final String thirdTitle;
  final String image;

  const OnboardingPage({
    super.key,
    required this.firstTitle,
    required this.secondTitle,
    required this.thirdTitle,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: SizeConfig.paddingSymmetric,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OnboardingTitle(
              firstTitle: firstTitle,
              secondTitle: secondTitle,
              thirdTitle: thirdTitle,
            ).animate().fadeIn(duration: 250.ms).then().slide(
                  duration: 250.ms,
                  begin: const Offset(0, -0.1),
                  end: Offset.zero,
                ),
          ],
        ),
      ),
    );
  }
}

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
