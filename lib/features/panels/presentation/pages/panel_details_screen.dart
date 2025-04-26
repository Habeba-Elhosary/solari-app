import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solari/core/constants/app_assets.dart';
import 'package:solari/core/constants/app_colors.dart';
import 'package:solari/core/constants/app_fonts.dart';
import 'package:solari/core/constants/app_text_styles.dart';
import 'package:solari/core/widgets/app_spacer.dart';
import 'package:solari/features/panels/presentation/widgets/auto_cleaning_section.dart';
import 'package:solari/features/panels/presentation/widgets/fault_log_section.dart';
import 'package:solari/features/panels/presentation/widgets/panel_performance.dart';

class PanelDetailsScreen extends StatelessWidget {
  const PanelDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          tr('panel_details'),
          style: TextStyles.regular24.copyWith(
            fontFamily: AppFonts.robotoSlab,
            color: AppColors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.sp),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 16.sp),
                  padding: EdgeInsets.all(24.sp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: AppColors.primary,
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Panel A100',
                            style: TextStyles.bold22.copyWith(
                              fontFamily: AppFonts.robotoSlab,
                              color: AppColors.white,
                            ),
                          ),
                          AppSpacer(heightRatio: 0.4),
                          Text(
                            'In good condition',
                            style: TextStyles.regular14.copyWith(
                              fontFamily: AppFonts.robotoSlab,
                              color: AppColors.white,
                              height: 2.sp,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Image.asset(AppAssets.panel, height: 75.sp),
                    ],
                  ),
                ),
                AppSpacer(heightRatio: 0.7),
                PanelPerformance(),
                AppSpacer(heightRatio: 0.7),
                FaultLogSection(),
                AppSpacer(heightRatio: 0.7),
                AutoCleaningSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
