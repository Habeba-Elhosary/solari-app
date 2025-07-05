import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:solari/core/constants/app_assets.dart';
import 'package:solari/core/constants/app_colors.dart';
import 'package:solari/core/constants/app_fonts.dart';
import 'package:solari/core/constants/app_text_styles.dart';
import 'package:solari/core/widgets/app_spacer.dart';
import 'package:solari/features/analytics/presentation/cubits/analytics_cubit.dart';

class PredictedEnergy extends StatelessWidget {
  const PredictedEnergy({super.key});

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
      padding: EdgeInsets.all(16.sp),
      margin: EdgeInsets.symmetric(horizontal: 16.sp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tr('predicted_energy_for_the_day'),
            style:
                TextStyles.regular16.copyWith(fontFamily: AppFonts.robotoSlab),
          ),
          AppSpacer(heightRatio: 0.5),
          Row(
            children: [
              Image.asset(AppAssets.energy, height: 32.sp),
              AppSpacer(widthRatio: 0.5),
              BlocBuilder<AnalyticsCubit, AnalyticsState>(
                builder: (context, state) {
                  if (state is AnalyticsLoading) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        width: 100.sp,
                        height: 30.sp,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          color: Colors.grey.shade300,
                        ),
                      ),
                    );
                  }
                  if (state is AnalyticsError) {
                    return Center(child: Text(state.message));
                  }
                  if (state is AnalyticsLoaded) {
                    return Text(
                      '${state.allAnalyticsResponse.data.totalEnergyToday} KWH',
                      style: TextStyles.bold10.copyWith(
                          fontFamily: AppFonts.robotoSlab, fontSize: 30.sp),
                    );
                  }
                  return SizedBox.shrink();
                },
              )
            ],
          ),
          AppSpacer(heightRatio: 0.5),
          Row(
            children: [
              BlocBuilder<AnalyticsCubit, AnalyticsState>(
                builder: (context, state) {
                  if (state is AnalyticsLoading) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        width: 50.sp,
                        height: 20.sp,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          color: Colors.grey.shade300,
                        ),
                      ),
                    );
                  }
                  if (state is AnalyticsError) {
                    return Center(child: Text(state.message));
                  }
                  if (state is AnalyticsLoaded) {
                    return Text(
                      '${state.allAnalyticsResponse.data.precentageChange}%',
                      style: TextStyles.medium16.copyWith(
                        fontFamily: AppFonts.robotoSlab,
                        color: AppColors.green,
                      ),
                    );
                  }
                  return SizedBox.shrink();
                },
              ),
              Text(
                '  from last day',
                style: TextStyles.medium16.copyWith(
                  fontFamily: AppFonts.robotoSlab,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
