import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solari/core/constants/app_assets.dart';
import 'package:solari/core/constants/app_colors.dart';
import 'package:solari/core/constants/app_fonts.dart';
import 'package:solari/core/constants/app_text_styles.dart';
import 'package:solari/core/widgets/app_spacer.dart';

class AutoCleaningSection extends StatelessWidget {
  const AutoCleaningSection({super.key});

  @override
  Widget build(BuildContext context) {
    bool isCleaning = true;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.sp),
          child: Text(
            tr('auto_cleaning'),
            style: TextStyles.bold22.copyWith(
              fontFamily: AppFonts.robotoSlab,
            ),
          ),
        ),
        AppSpacer(heightRatio: 0.7),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 180.sp,
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
                margin: EdgeInsets.only(left: 16.sp, bottom: 16.sp),
                padding: EdgeInsets.all(16.sp),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      tr('water_level'),
                      style: TextStyles.regular20.copyWith(
                        fontFamily: AppFonts.robotoSlab,
                      ),
                    ),
                    AppSpacer(heightRatio: 0.5),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          AppAssets.waterLevel,
                          height: 100.sp,
                        ),
                        Positioned(
                          bottom: 20.sp,
                          child: Text('55%',
                              style: TextStyles.bold20.copyWith(
                                fontFamily: AppFonts.robotoSlab,
                                color: AppColors.white,
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            if (isCleaning) ...[
              Expanded(
                child: Container(
                  height: 180.sp,
                  margin:
                      EdgeInsets.only(left: 8.sp, right: 16.sp, bottom: 16.sp),
                  padding:
                      EdgeInsets.symmetric(vertical: 16.sp, horizontal: 8.sp),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        spreadRadius: 1,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        tr('in_cleaning_mode'),
                        style: TextStyles.regular20.copyWith(
                          fontFamily: AppFonts.robotoSlab,
                        ),
                      ),
                      Spacer(),
                      Image.asset(AppAssets.cleaningMode, height: 120.sp),
                    ],
                  ),
                ),
              ),
            ] else ...[
              Expanded(
                child: Container(
                  height: 180.sp,
                  margin:
                      EdgeInsets.only(left: 8.sp, right: 16.sp, bottom: 16.sp),
                  padding:
                      EdgeInsets.symmetric(vertical: 16.sp, horizontal: 8.sp),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        spreadRadius: 1,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        tr('time_remaining'),
                        style: TextStyles.regular20.copyWith(
                          fontFamily: AppFonts.robotoSlab,
                        ),
                      ),
                      Spacer(),
                      Text(
                        '02 : 30 : 06',
                        style: TextStyle(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: AppFonts.robotoSlab,
                          color: AppColors.black,
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.sp, vertical: 10.sp),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(40.r),
                          ),
                          child: Text(
                            tr('edit_time_period'),
                            style: TextStyles.regular16.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}
