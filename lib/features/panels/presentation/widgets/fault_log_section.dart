import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solari/core/constants/app_assets.dart';
import 'package:solari/core/constants/app_colors.dart';
import 'package:solari/core/constants/app_fonts.dart';
import 'package:solari/core/constants/app_text_styles.dart';
import 'package:solari/core/widgets/app_spacer.dart';
import 'package:solari/features/panels/presentation/widgets/fault_log_entry.dart';

class FaultLogSection extends StatelessWidget {
  const FaultLogSection({super.key});

  final List<Map<String, String>> faultLogs = const [
    {
      'title': 'Grid anomaly',
      'description': 'Intermittent Voltage Sags',
      'time': '10:00 AM',
      'date': '10-2-25',
    },
    {
      'title': 'Feedback sensor fault',
      'description': 'a problem with one of the sensors',
      'time': '10:00 AM',
      'date': '10-2-25',
    },
    {
      'title': 'PV mismatch',
      'description': 'Shading, Panel degradation',
      'time': '10:00 AM',
      'date': '10-2-25',
    },
    {
      'title': 'Inverter fault',
      'description': 'fault in one of the six IGBTs',
      'time': '10:00 AM',
      'date': '10-2-25',
    },
  ];

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
          Row(
            children: [
              Text(
                tr('fault_log'),
                style: TextStyles.bold22.copyWith(
                  fontFamily: AppFonts.robotoSlab,
                ),
              ),
              Spacer(),
              SvgPicture.asset(AppAssets.upperArrow, height: 17.sp)
            ],
          ),
          AppSpacer(heightRatio: 0.5),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: faultLogs.length,
            separatorBuilder: (context, index) => AppSpacer(heightRatio: 0.6),
            itemBuilder: (context, index) {
              final log = faultLogs[index];
              return FaultLogEntry(
                title: log['title']!,
                description: log['description']!,
                time: log['time']!,
                date: log['date']!,
              );
            },
          ),
        ],
      ),
    );
  }
}
