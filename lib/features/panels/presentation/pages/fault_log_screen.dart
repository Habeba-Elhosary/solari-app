import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solari/core/constants/app_colors.dart';
import 'package:solari/core/constants/app_fonts.dart';
import 'package:solari/core/constants/app_text_styles.dart';
import 'package:solari/core/widgets/app_spacer.dart';
import 'package:solari/features/panels/presentation/cubits/panel_faults/panel_faults_cubit.dart';
import 'package:solari/features/panels/presentation/widgets/fault_log_entry.dart';
import 'package:solari/injection_container.dart';

class FaultLogScreen extends StatelessWidget {
  final int panelId;
  const FaultLogScreen({super.key, required this.panelId});

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
      body: BlocProvider<PanelFaultsCubit>(
        create: (context) =>
            sl<PanelFaultsCubit>()..getPanelFaultsEvent(panelId),
        child: BlocBuilder<PanelFaultsCubit, PanelFaultsState>(
          builder: (context, state) {
            if (state is PanelFaultsLoading) {
              return const Center(child: CircularProgressIndicator.adaptive());
            }
            if (state is PanelFaultsError) {
              return Center(child: Text(state.message));
            }
            if (state is PanelFaultsSuccess) {
              return SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(16.sp),
                  child: state.faults.isEmpty
                      ? Center(child: Text(tr('No Faults Found')))
                      : ListView.separated(
                          itemBuilder: (context, index) => Container(
                            padding: EdgeInsets.all(10.sp),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              color: AppColors.white,
                            ),
                            child: FaultLogEntry(
                              title: state.faults[index].title,
                              description: state.faults[index].desc,
                              //TODO : get time and date
                              time: '10:00 AM',
                              date: '10-2-25',
                            ),
                          ),
                          separatorBuilder: (context, index) =>
                              AppSpacer(heightRatio: 0.3),
                          itemCount: state.faults.length,
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
