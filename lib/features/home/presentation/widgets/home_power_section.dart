import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solari/core/constants/app_assets.dart';
import 'package:solari/core/constants/app_colors.dart';
import 'package:solari/core/constants/app_fonts.dart';
import 'package:solari/core/constants/app_text_styles.dart';
import 'package:solari/core/widgets/app_spacer.dart';

class HomePowerSection extends StatelessWidget {
  const HomePowerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.sp),
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 1,
                blurRadius: 4,
                offset: Offset(0, 4),
              ),
            ],
          ),
          margin: EdgeInsets.symmetric(horizontal: 16.sp),
          padding: EdgeInsets.all(30.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(AppAssets.power, height: 100.sp),
              AppSpacer(widthRatio: 2),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    tr('generated_power'),
                    style: TextStyles.semiBold16.copyWith(
                      color: AppColors.greyDark,
                      fontFamily: AppFonts.robotoSlab,
                    ),
                  ),
                  AppSpacer(heightRatio: 0.5),
                  Text(
                    '625 kwh',
                    style: TextStyles.semiBold16.copyWith(
                      color: AppColors.primary,
                      fontFamily: AppFonts.robotoSlab,
                      fontSize: 36.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        AppSpacer(heightRatio: 0.7),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.sp),
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 1,
                blurRadius: 4,
                offset: Offset(0, 4),
              ),
            ],
          ),
          padding: EdgeInsets.all(16.sp),
          margin: EdgeInsets.symmetric(horizontal: 16.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tr('total_daily_generation'),
                style: TextStyles.semiBold16.copyWith(
                  color: AppColors.greyDark,
                  fontFamily: AppFonts.robotoSlab,
                ),
              ),
              AppSpacer(heightRatio: 0.5),
              Text(
                '20 Kw/ 1000 Kw',
                style: TextStyles.semiBold16.copyWith(
                  color: AppColors.black,
                  fontFamily: AppFonts.robotoSlab,
                  fontSize: 28.sp,
                ),
              ),
              AppSpacer(heightRatio: 0.5),
              LinearProgressIndicator(
                borderRadius: BorderRadius.circular(20.sp),
                minHeight: 20.sp,
                value: 0.3,
                color: AppColors.primary,
                backgroundColor: AppColors.scaffoldBackgroundColor,
              )
            ],
          ),
        ),
      ],
    );
  }
}
