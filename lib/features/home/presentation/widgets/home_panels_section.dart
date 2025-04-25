import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solari/core/constants/app_colors.dart';
import 'package:solari/core/constants/app_fonts.dart';
import 'package:solari/core/constants/app_text_styles.dart';
import 'package:solari/core/enums/panel_status.dart';

class HomePanelsSection extends StatelessWidget {
  HomePanelsSection({super.key});

  final List<Map<String, dynamic>> items = [
    {'id': 'A100', 'status': PanelStatus.healthy},
    {'id': 'A101', 'status': PanelStatus.poor},
    {'id': 'A110', 'status': PanelStatus.healthy},
    {'id': 'A111', 'status': PanelStatus.faulted},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.sp),
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
      padding: EdgeInsets.all(16.sp),
      margin: EdgeInsets.symmetric(horizontal: 16.sp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(16.sp),
            decoration: BoxDecoration(
              color: AppColors.scaffoldBackgroundColor,
              borderRadius: BorderRadius.all(Radius.circular(10.sp)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'ID',
                  style: TextStyles.semiBold16
                      .copyWith(fontFamily: AppFonts.robotoSlab),
                ),
                Text(
                  'Status',
                  style: TextStyles.semiBold16
                      .copyWith(fontFamily: AppFonts.robotoSlab),
                ),
              ],
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: items.length,
            separatorBuilder: (context, index) => Divider(
              thickness: 2.sp,
              color: AppColors.scaffoldBackgroundColor,
            ),
            itemBuilder: (context, index) {
              final item = items[index];
              final PanelStatus status = item['status'];

              return Padding(
                padding:
                    EdgeInsets.symmetric(vertical: 10.sp, horizontal: 16.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item['id'],
                      style: TextStyles.regular14
                          .copyWith(fontFamily: AppFonts.roboto),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.sp,
                        vertical: 4.sp,
                      ),
                      decoration: BoxDecoration(
                        color: status.backgroundColor,
                        borderRadius: BorderRadius.circular(20.sp),
                      ),
                      child: Text(
                        status.label,
                        style: TextStyles.regular12.copyWith(
                          color: status.textColor,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
