import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solari/core/constants/app_assets.dart';
import 'package:solari/core/constants/app_colors.dart';
import 'package:solari/core/constants/app_fonts.dart';
import 'package:solari/core/constants/app_text_styles.dart';
import 'package:solari/core/widgets/app_spacer.dart';
import 'package:solari/features/panels/presentation/widgets/performance_item.dart';

class PanelPerformance extends StatelessWidget {
  final String current;
  final String voltage;
  final String power;
  final String todayEnergy;

  const PanelPerformance({
    super.key,
    required this.current,
    required this.voltage,
    required this.power,
    required this.todayEnergy,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
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
      padding: EdgeInsets.all(16.sp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tr('performance'),
            style: TextStyles.bold22.copyWith(
              fontFamily: AppFonts.robotoSlab,
            ),
          ),
          AppSpacer(heightRatio: 0.3),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PerformanceItem(
                    title: '${tr('current')} :',
                    value: current,
                  ),
                  AppSpacer(heightRatio: 0.3),
                  PerformanceItem(
                    title: "${tr('voltage')} :",
                    value: voltage,
                  ),
                  AppSpacer(heightRatio: 0.3),
                  PerformanceItem(
                    title: "${tr('power')} :",
                    value: power,
                  ),
                  AppSpacer(heightRatio: 0.3),
                  PerformanceItem(
                    title: "${tr('energy')} :",
                    value: todayEnergy,
                  ),
                ],
              ),
              Spacer(),
              Image.asset(AppAssets.panelPerformance, height: 140.sp),
            ],
          )
        ],
      ),
    );
  }
}
