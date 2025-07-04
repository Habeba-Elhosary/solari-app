import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solari/core/constants/app_assets.dart';
import 'package:solari/core/constants/app_colors.dart';
import 'package:solari/core/constants/app_fonts.dart';
import 'package:solari/core/constants/app_text_styles.dart';
import 'package:solari/core/widgets/app_spacer.dart';
import 'package:solari/features/panels/domain/entities/panel_details_response.dart';
import 'package:solari/features/panels/presentation/pages/fault_log_screen.dart';
import 'package:solari/features/panels/presentation/widgets/fault_log_entry.dart';
import 'package:solari/injection_container.dart';

class FaultLogSection extends StatelessWidget {
  final int panelId;
  final List<Fault>? faults;
  const FaultLogSection({super.key, this.faults, required this.panelId});

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
          GestureDetector(
            onTap: () {
              appNavigator.push(screen: FaultLogScreen(panelId: panelId));
            },
            child: Row(
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
          ),
          AppSpacer(heightRatio: 0.5),
          if (faults != null && faults!.isNotEmpty) ...[
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: faults!.length,
              separatorBuilder: (context, index) => AppSpacer(heightRatio: 0.6),
              itemBuilder: (context, index) {
                final log = faults![index];
                return FaultLogEntry(
                  title: log.title,
                  description: log.desc,
                  // TODO : GET IT FROM BACK
                  time: '',
                  date: '',
                );
              },
            ),
          ] else ...[
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.sp),
                child: Text(tr('No Faults Found')),
              ),
            ),
          ]
        ],
      ),
    );
  }
}
