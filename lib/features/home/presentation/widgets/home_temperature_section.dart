import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solari/core/constants/app_assets.dart';
import 'package:solari/core/constants/app_colors.dart';
import 'package:solari/core/constants/app_fonts.dart';
import 'package:solari/core/constants/app_text_styles.dart';
import 'package:solari/core/widgets/app_spacer.dart';

class HomeTemperatureSection extends StatelessWidget {
  const HomeTemperatureSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      margin: EdgeInsets.only(left: 16.sp, right: 16.sp, bottom: 16.sp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            tr('current_temperature'),
            style: TextStyles.semiBold16.copyWith(
              color: AppColors.greyDark,
              fontFamily: AppFonts.robotoSlab,
            ),
          ),
          AppSpacer(heightRatio: 0.5),
          Text(
            '35°',
            style: TextStyles.regular12.copyWith(
              fontFamily: AppFonts.robotoSlab,
              fontSize: 57.sp,
            ),
          ),
          AppSpacer(heightRatio: 0.5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppAssets.sun, height: 20.sp),
              AppSpacer(widthRatio: 0.3),
              Text(
                'High intense',
                style: TextStyles.semiBold14.copyWith(
                  color: Color(0XFFF24805),
                  fontFamily: AppFonts.roboto,
                ),
              ),
              Spacer(),
              Image.asset(AppAssets.cloud, height: 20.sp),
              AppSpacer(widthRatio: 0.3),
              Text(
                'Clear',
                style: TextStyles.semiBold14.copyWith(
                  color: AppColors.primary,
                  fontFamily: AppFonts.roboto,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
