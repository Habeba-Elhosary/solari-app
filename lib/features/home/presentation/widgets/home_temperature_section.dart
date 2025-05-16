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

class HomeTemperatureSection extends StatelessWidget {
  const HomeTemperatureSection({super.key});

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
      margin: EdgeInsets.only(left: 16.sp, right: 16.sp, bottom: 16.sp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            tr('current_temperature'),
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
                    width: 90.sp,
                    height: 50.sp,
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
                  '${state.getSystemHomeResponse.data.temperature}°',
                  style: TextStyles.regular12.copyWith(
                    fontFamily: AppFonts.robotoSlab,
                    fontSize: 57.sp,
                  ),
                );
              }
              return SizedBox.shrink();
            },
          ),
          AppSpacer(heightRatio: 0.5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppAssets.sun, height: 20.sp),
              AppSpacer(widthRatio: 0.3),
              BlocBuilder<SystemHomeCubit, SystemHomeState>(
                builder: (context, state) {
                  if (state is SystemHomeLoading) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        width: 50.sp,
                        height: 15.sp,
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
                      state.getSystemHomeResponse.data.systemTemperatureLabel,
                      style: TextStyles.semiBold14.copyWith(
                        color: AppColors.red,
                        fontFamily: AppFonts.roboto,
                      ),
                    );
                  }
                  return SizedBox.shrink();
                },
              ),
              Spacer(),
              // Image.asset(AppAssets.cloud, height: 20.sp),
              // AppSpacer(widthRatio: 0.3),
              // Text(
              //   'Clear',
              //   style: TextStyles.semiBold14.copyWith(
              //     color: AppColors.primary,
              //     fontFamily: AppFonts.roboto,
              //   ),
              // ),
            ],
          )
        ],
      ),
    );
  }
}
