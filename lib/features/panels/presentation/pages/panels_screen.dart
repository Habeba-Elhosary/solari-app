import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solari/core/constants/app_assets.dart';
import 'package:solari/core/constants/app_colors.dart';
import 'package:solari/core/constants/app_fonts.dart';
import 'package:solari/core/constants/app_text_styles.dart';
import 'package:solari/core/widgets/app_spacer.dart';
import 'package:solari/features/panels/presentation/widgets/all_panels_section.dart';

class PanelsScreen extends StatelessWidget {
  const PanelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          tr('panels'),
          style: TextStyles.regular24.copyWith(
            fontFamily: AppFonts.robotoSlab,
            color: AppColors.black,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.sp),
            child: GestureDetector(
              // TODO
              onTap: () {},
              child: SvgPicture.asset(AppAssets.notifications),
            ),
          )
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(16.sp),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(24.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: AppColors.primary,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'All 4 panels are active',
                    style: TextStyles.bold22.copyWith(
                      fontFamily: AppFonts.robotoSlab,
                      color: AppColors.white,
                    ),
                  ),
                  AppSpacer(heightRatio: 0.4),
                  Text(
                    'The system temperature is 24°C \nSolar tracking system is  is activated ',
                    style: TextStyles.regular14.copyWith(
                      fontFamily: AppFonts.robotoSlab,
                      color: AppColors.white,
                      height: 2.sp,
                    ),
                  ),
                ],
              ),
            ),
            AppSpacer(heightRatio: 0.7),
            AllPanelsSection(),
          ],
        ),
      )),
    );
  }
}
