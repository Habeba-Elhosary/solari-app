import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solari/core/constants/app_colors.dart';
import 'package:solari/core/constants/app_fonts.dart';
import 'package:solari/core/constants/app_text_styles.dart';
import 'package:solari/core/widgets/app_spacer.dart';
import 'package:solari/features/panels/presentation/widgets/fault_log_entry.dart';

class FaultLogScreen extends StatelessWidget {
  const FaultLogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          tr('fault_log'),
          style: TextStyles.regular24.copyWith(
            fontFamily: AppFonts.robotoSlab,
            color: AppColors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.sp),
          child: ListView.separated(
            itemBuilder: (context, index) => Container(
              padding: EdgeInsets.all(10.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: AppColors.white,
              ),
              child: FaultLogEntry(
                title: 'Grid anomaly',
                description:
                    'Hardware Failures, Software Glitches, Environmental Factorsx',
                time: '10:00 AM',
                date: '10-2-25',
              ),
            ),
            separatorBuilder: (context, index) => AppSpacer(heightRatio: 0.3),
            itemCount: 20,
          ),
        ),
      ),
    );
  }
}
