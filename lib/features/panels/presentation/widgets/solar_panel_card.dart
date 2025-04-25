// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solari/core/constants/app_assets.dart';
import 'package:solari/core/constants/app_colors.dart';
import 'package:solari/core/constants/app_fonts.dart';
import 'package:solari/core/constants/app_text_styles.dart';
import 'package:solari/core/widgets/app_spacer.dart';

class SolarPanelCard extends StatelessWidget {
  final String id;
  final String power;
  final String statusLabel;
  final Color textColor;
  final Color backgroundColor;

  const SolarPanelCard({
    super.key,
    required this.id,
    required this.power,
    required this.statusLabel,
    required this.textColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: textColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(20.r),
        color: AppColors.white,
      ),
      padding: EdgeInsets.all(16.sp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                AppAssets.panel,
                height: 50.sp,
              ),
              AppSpacer(widthRatio: 0.4),
              Text(
                id,
                style: TextStyles.regular16
                    .copyWith(fontFamily: AppFonts.robotoSlab),
              ),
            ],
          ),
          AppSpacer(heightRatio: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    AppAssets.energy,
                    height: 14.sp,
                  ),
                  SizedBox(width: 4.sp),
                  Text(
                    power,
                    style: TextStyles.regular14.copyWith(
                      color: AppColors.greyDark,
                      fontFamily: AppFonts.robotoSlab,
                    ),
                  ),
                ],
              ),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: 12.sp, vertical: 4.sp),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(20.sp),
                ),
                child: Text(
                  statusLabel,
                  style: TextStyles.semiBold12.copyWith(color: textColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
