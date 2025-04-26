import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solari/core/constants/app_assets.dart';
import 'package:solari/core/constants/app_colors.dart';
import 'package:solari/core/constants/app_fonts.dart';
import 'package:solari/core/constants/app_text_styles.dart';
import 'package:solari/core/widgets/app_spacer.dart';

class NotificationsScreen extends StatelessWidget {
  NotificationsScreen({super.key});

  Map<String, dynamic> _getNotificationStyle(String type) {
    switch (type) {
      case 'warning':
        return {
          'icon': Icon(Icons.warning_rounded, color: AppColors.red),
          'backgroundColor': Color(0XFFFFE6E6),
        };
      case 'reminder':
        return {
          'icon': SvgPicture.asset(AppAssets.notificationBlue),
          'backgroundColor': Color(0XFFEDF2FF),
        };
      default:
        return {
          'icon': Icon(Icons.warning_rounded, color: AppColors.red),
          'backgroundColor': Color(0XFFFFE6E6),
        };
    }
  }

  final List<Map<String, dynamic>> notifications = [
    {
      'date': 'Today',
      'items': [
        {
          'type': 'warning',
          'title': 'Fault in panel A100',
          'subtitle': 'grid anomaly',
          'time': '10:00 AM\n10-2-25',
        },
        {
          'type': 'reminder',
          'title': 'Reminder to fill the water',
          'subtitle': 'level of water is low',
          'time': '10:00 AM\n10-2-25',
        },
      ],
    },
    {
      'date': '5 September',
      'items': [
        {
          'type': 'warning',
          'title': 'Fault in panel A100',
          'subtitle': 'inverter fault',
          'time': '10:00 AM\n10-2-25',
        },
        {
          'type': 'warning',
          'title': 'Fault in panel A100',
          'subtitle': 'inverter fault',
          'time': '10:00 AM\n10-2-25',
        },
        {
          'type': 'warning',
          'title': 'Fault in panel A100',
          'subtitle': 'inverter fault',
          'time': '10:00 AM\n10-2-25',
        },
        {
          'type': 'warning',
          'title': 'Fault in panel A100',
          'subtitle': 'inverter fault',
          'time': '10:00 AM\n10-2-25',
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          tr('notifications'),
          style: TextStyles.regular24.copyWith(
            fontFamily: AppFonts.robotoSlab,
            color: AppColors.black,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.sp),
        child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            final group = notifications[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  group['date'],
                  style: TextStyles.regular22
                      .copyWith(fontFamily: AppFonts.robotoSlab),
                ),
                AppSpacer(heightRatio: 0.3),
                ...group['items'].map<Widget>((item) {
                  final style = _getNotificationStyle(item['type']);
                  return Container(
                    padding: EdgeInsets.all(10.sp),
                    margin: EdgeInsets.only(bottom: 10.sp),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: AppColors.white,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(8.sp),
                          decoration: BoxDecoration(
                            color: style['backgroundColor'],
                            shape: BoxShape.circle,
                          ),
                          child: style['icon'],
                        ),
                        AppSpacer(widthRatio: 0.5),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['title'],
                                style: TextStyles.regular14.copyWith(
                                  fontFamily: AppFonts.robotoSlab,
                                ),
                              ),
                              AppSpacer(heightRatio: 0.2),
                              Text(
                                item['subtitle'],
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
                              item['time'],
                              style: TextStyles.regular12.copyWith(
                                color: AppColors.greyDark,
                                fontFamily: AppFonts.robotoSlab,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ],
            );
          },
        ),
      ),
    );
  }
}
