import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solari/core/constants/app_assets.dart';
import 'package:solari/core/constants/app_colors.dart';
import 'package:solari/core/constants/app_fonts.dart';
import 'package:solari/core/constants/app_text_styles.dart';
import 'package:solari/core/widgets/app_spacer.dart';

class PredictedEnergy extends StatelessWidget {
  const PredictedEnergy({super.key});

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
      margin: EdgeInsets.symmetric(horizontal: 16.sp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tr('predicted_energy_for_the_day'),
            style:
                TextStyles.regular16.copyWith(fontFamily: AppFonts.robotoSlab),
          ),
          AppSpacer(heightRatio: 0.5),
          Row(
            children: [
              Image.asset(AppAssets.energy, height: 32.sp),
              AppSpacer(widthRatio: 0.5),
              Text(
                '4.8 KWH',
                style: TextStyles.bold10
                    .copyWith(fontFamily: AppFonts.robotoSlab, fontSize: 30.sp),
              )
            ],
          ),
          AppSpacer(heightRatio: 0.5),
          Row(
            children: [
              Text(
                '+20.1% ',
                style: TextStyles.medium16.copyWith(
                  fontFamily: AppFonts.robotoSlab,
                  color: AppColors.green,
                ),
              ),
              Text(
                'from last day',
                style: TextStyles.medium16.copyWith(
                  fontFamily: AppFonts.robotoSlab,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
