import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solari/core/constants/app_assets.dart';
import 'package:solari/core/constants/app_colors.dart';
import 'package:solari/core/constants/app_fonts.dart';
import 'package:solari/core/constants/app_text_styles.dart';
import 'package:solari/core/widgets/app_spacer.dart';
import 'package:solari/features/panels/presentation/cubits/panel_details/panel_details_cubit.dart';
import 'package:solari/features/panels/presentation/widgets/auto_cleaning_section.dart';
import 'package:solari/features/panels/presentation/widgets/fault_log_section.dart';
import 'package:solari/features/panels/presentation/widgets/panel_performance.dart';
import 'package:solari/injection_container.dart';

class PanelDetailsScreen extends StatelessWidget {
  final int panelId;
  const PanelDetailsScreen({super.key, required this.panelId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          tr('panel_details'),
          style: TextStyles.regular24.copyWith(
            fontFamily: AppFonts.robotoSlab,
            color: AppColors.black,
          ),
        ),
      ),
      body: BlocProvider<PanelDetailsCubit>(
        create: (context) =>
            sl<PanelDetailsCubit>()..getPanelDetailsEvent(panelId: panelId),
        child: BlocBuilder<PanelDetailsCubit, PanelDetailsState>(
          builder: (context, state) {
            if (state is PanelDetailsLoading) {
              return const Center(child: CircularProgressIndicator.adaptive());
            }
            if (state is PanelDetailsError) {
              return Center(child: Text(state.message));
            }
            if (state is PanelDetailsSuccess) {
              return SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.sp),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(horizontal: 16.sp),
                          padding: EdgeInsets.all(24.sp),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: AppColors.primary,
                          ),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.panelDetailsResponse.data.name,
                                    style: TextStyles.bold22.copyWith(
                                      fontFamily: AppFonts.robotoSlab,
                                      color: AppColors.white,
                                    ),
                                  ),
                                  AppSpacer(heightRatio: 0.4),
                                  Text(
                                    state.panelDetailsResponse.data.status
                                        .getServerString(),
                                    style: TextStyles.regular14.copyWith(
                                      fontFamily: AppFonts.robotoSlab,
                                      color: AppColors.white,
                                      height: 2.sp,
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Image.asset(AppAssets.panel, height: 75.sp),
                            ],
                          ),
                        ),
                        AppSpacer(heightRatio: 0.7),
                        PanelPerformance(
                          current: state.panelDetailsResponse.data.current,
                          voltage: state.panelDetailsResponse.data.voltage,
                          power: state.panelDetailsResponse.data.power,
                          todayEnergy:
                              state.panelDetailsResponse.data.todayEnergy,
                        ),
                        AppSpacer(heightRatio: 0.7),
                        FaultLogSection(
                          faults: state.panelDetailsResponse.data.faults,
                        ),
                        AppSpacer(heightRatio: 0.7),
                        AutoCleaningSection(
                          waterLevel:
                              state.panelDetailsResponse.data.waterLevel,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
