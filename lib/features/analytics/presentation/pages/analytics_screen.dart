import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solari/core/constants/app_assets.dart';
import 'package:solari/core/constants/app_colors.dart';
import 'package:solari/core/constants/app_fonts.dart';
import 'package:solari/core/constants/app_text_styles.dart';
import 'package:solari/core/widgets/app_spacer.dart';
import 'package:solari/features/analytics/presentation/cubits/analytics_cubit.dart';
import 'package:solari/features/analytics/presentation/widgets/generating_chart.dart';
import 'package:solari/features/analytics/presentation/widgets/performance_metrics.dart';
import 'package:solari/features/analytics/presentation/widgets/predicted_energy.dart';
import 'package:solari/features/profile/presentation/pages/notifications_screen.dart';
import 'package:solari/injection_container.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AnalyticsCubit>().getAllAnalyticsEvent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          tr('analytics'),
          style: TextStyles.regular24.copyWith(
            fontFamily: AppFonts.robotoSlab,
            color: AppColors.black,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.sp),
            child: GestureDetector(
              onTap: () {
                appNavigator.push(screen: NotificationsScreen());
              },
              child: SvgPicture.asset(AppAssets.notifications),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 16.sp, bottom: 16.sp),
          child: SingleChildScrollView(
            child: Column(
              children: [
                GeneratingChart(),
                AppSpacer(heightRatio: 0.7),
                PredictedEnergy(),
                AppSpacer(heightRatio: 0.7),
                PerformanceMetricsChart(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
