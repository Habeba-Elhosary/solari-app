// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:solari/core/constants/app_assets.dart';
import 'package:solari/core/constants/app_colors.dart';
import 'package:solari/core/constants/app_fonts.dart';
import 'package:solari/core/constants/app_text_styles.dart';
import 'package:solari/core/widgets/app_spacer.dart';
import 'package:solari/features/panels/presentation/pages/panel_details_screen.dart';
import 'package:solari/injection_container.dart';

class SolarPanelCard extends StatelessWidget {
  final int id;
  final String name;
  final String power;
  final String statusLabel;
  final Color textColor;
  final Color backgroundColor;

  const SolarPanelCard({
    super.key,
    required this.id,
    required this.name,
    required this.power,
    required this.statusLabel,
    required this.textColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => appNavigator.push(screen: PanelDetailsScreen(panelId: id)),
      child: Container(
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
                  name,
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
      ),
    );
  }
}

class SolarPanelCardShimmer extends StatelessWidget {
  const SolarPanelCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade300,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(20.r),
          color: AppColors.white,
        ),
        padding: EdgeInsets.all(16.sp),
      ),
    );
  }
}
