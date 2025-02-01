import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solari/core/constants/app_assets.dart';
import 'package:solari/core/constants/app_colors.dart';
import 'package:solari/core/constants/app_fonts.dart';
import 'package:solari/core/constants/app_text_styles.dart';
import 'package:solari/core/widgets/app_spacer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.appLogoWhite,
              width: 130.w,
            )
                .animate()
                .scaleXY(
                  begin: 0.5,
                  end: 1.0,
                  duration: 1500.ms,
                  curve: Curves.easeOutBack,
                )
                .fadeIn(duration: 600.ms),
            AppSpacer(heightRatio: 0.5),
            Text(
              tr('app_name'),
              style: TextStyles.regular24.copyWith(
                  fontFamily: AppFonts.robotoSlab,
                  color: AppColors.white,
                  fontSize: 32.sp),
            )
                .animate()
                .fadeIn(duration: 800.ms)
                .slideY(
                    begin: 0.5, end: 0, duration: 800.ms, curve: Curves.easeOut)
                .shimmer(duration: 2.seconds),
          ],
        ),
      ),
    );
  }
}
