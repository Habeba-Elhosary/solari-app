import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solari/core/constants/app_colors.dart';
import 'package:solari/core/constants/app_fonts.dart';
import 'package:solari/core/constants/app_text_styles.dart';
import 'package:solari/core/widgets/app_spacer.dart';

class FaultLogEntry extends StatelessWidget {
  final String title;
  final String description;
  final String time;
  final String date;

  const FaultLogEntry({
    super.key,
    required this.title,
    required this.description,
    required this.time,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(8.sp),
          decoration: BoxDecoration(
            color: Color(0XFFFFE6E6),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.warning_rounded,
            color: AppColors.red,
            size: 20.sp,
          ),
        ),
        AppSpacer(widthRatio: 0.5),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyles.regular14.copyWith(
                  fontFamily: AppFonts.robotoSlab,
                ),
              ),
              AppSpacer(heightRatio: 0.2),
              Text(
                description,
                style: TextStyles.regular12.copyWith(
                  color: AppColors.greyDark,
                  fontFamily: AppFonts.robotoSlab,
                ),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              time,
              style: TextStyles.regular12.copyWith(
                color: AppColors.greyDark,
                fontFamily: AppFonts.robotoSlab,
              ),
            ),
            AppSpacer(heightRatio: 0.2),
            Text(
              date,
              style: TextStyles.regular12.copyWith(
                color: AppColors.greyDark,
                fontFamily: AppFonts.robotoSlab,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
