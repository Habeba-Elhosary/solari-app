import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solari/core/enums/panel_status.dart';
import 'package:solari/features/panels/presentation/cubits/all_panels/all_panels_cubit.dart';
import 'package:solari/features/panels/presentation/widgets/solar_panel_card.dart';

class AllPanelsSection extends StatelessWidget {
  AllPanelsSection({super.key});

  final List<Map<String, dynamic>> panels = [];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<AllPanelsCubit, AllPanelsState>(
        builder: (context, state) {
          if (state is AllPanelsLoading) {
            return GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.sp,
                mainAxisSpacing: 16.sp,
                childAspectRatio: 4 / 3,
              ),
              itemCount: 20,
              itemBuilder: (context, index) {
                return SolarPanelCardShimmer();
              },
            );
          }
          if (state is AllPanelsError) {
            return Center(child: Text(state.message));
          }
          if (state is AllPanelsSuccess) {
            return GridView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.sp,
                mainAxisSpacing: 16.sp,
                childAspectRatio: 4 / 3,
              ),
              itemCount: state.allPanelsResponse.data.cells.length,
              itemBuilder: (context, index) {
                final panel = state.allPanelsResponse.data.cells[index];
                final PanelStatus status = panel.status;
                return SolarPanelCard(
                  id: panel.id,
                  name: panel.name,
                  power: panel.todayEnergy,
                  statusLabel: status.label,
                  textColor: status.textColor,
                  backgroundColor: status.backgroundColor,
                );
              },
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
