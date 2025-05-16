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
import 'package:solari/features/home/presentation/cubits/system_home/system_home_cubit.dart';

class HomePowerSection extends StatelessWidget {
  const HomePowerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
          padding: EdgeInsets.all(30.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(AppAssets.power, height: 100.sp),
              AppSpacer(widthRatio: 2),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    tr('generated_power'),
                    style: TextStyles.semiBold16.copyWith(
                      color: AppColors.greyDark,
                      fontFamily: AppFonts.robotoSlab,
                    ),
                  ),
                  AppSpacer(heightRatio: 0.5),
                  BlocBuilder<SystemHomeCubit, SystemHomeState>(
                    builder: (context, state) {
                      if (state is SystemHomeLoading) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: Container(
                            width: 145.sp,
                            height: 35.sp,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.r),
                              color: Colors.grey.shade300,
                            ),
                          ),
                        );
                      }
                      if (state is SystemHomeError) {
                        return Text(state.message);
                      }
                      if (state is SystemHomeSuccess) {
                        return Text(
                          state.getSystemHomeResponse.data.totalPower,
                          style: TextStyles.semiBold16.copyWith(
                            color: AppColors.primary,
                            fontFamily: AppFonts.robotoSlab,
                            fontSize: 36.sp,
                          ),
                        );
                      }
                      return SizedBox.shrink();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        AppSpacer(heightRatio: 0.7),
        Container(
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
                tr('total_daily_generation'),
                style: TextStyles.semiBold16.copyWith(
                  color: AppColors.greyDark,
                  fontFamily: AppFonts.robotoSlab,
                ),
              ),
              AppSpacer(heightRatio: 0.5),
              BlocBuilder<SystemHomeCubit, SystemHomeState>(
                builder: (context, state) {
                  if (state is SystemHomeLoading) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        width: 145.sp,
                        height: 35.sp,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          color: Colors.grey.shade300,
                        ),
                      ),
                    );
                  }
                  if (state is SystemHomeError) {
                    return Text(state.message);
                  }
                  if (state is SystemHomeSuccess) {
                    return Text(
                      state.getSystemHomeResponse.data.totalDailyGeneration,
                      style: TextStyles.semiBold16.copyWith(
                        color: AppColors.black,
                        fontFamily: AppFonts.robotoSlab,
                        fontSize: 28.sp,
                      ),
                    );
                  }
                  return SizedBox.shrink();
                },
              ),
              AppSpacer(heightRatio: 0.5),
              BlocBuilder<SystemHomeCubit, SystemHomeState>(
                builder: (context, state) {
                  if (state is SystemHomeLoading) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.white,
                      child: Container(
                        height: 20.sp,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: FractionallySizedBox(
                            widthFactor: 0.45,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blue.shade900,
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }

                  if (state is SystemHomeError) {
                    return Text(state.message);
                  }
                  if (state is SystemHomeSuccess) {
                    return LinearProgressIndicator(
                      borderRadius: BorderRadius.circular(20.sp),
                      minHeight: 20.sp,
                      value: parseTotalDailyGeneration(
                        state.getSystemHomeResponse.data.totalDailyGeneration,
                      ),
                      color: AppColors.primary,
                      backgroundColor: AppColors.scaffoldBackgroundColor,
                    );
                  }
                  return SizedBox.shrink();
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}

double parseTotalDailyGeneration(String input) {
  List<String> parts = input.split('/');
  double first = double.parse(parts[0].trim().split(' ')[0]);
  double second = double.parse(parts[1].trim().split(' ')[0]);

  if (second == 0) return 0;

  return first / second;
}
