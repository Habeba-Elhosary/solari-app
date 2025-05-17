import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solari/core/enums/panel_status.dart';
import 'package:solari/features/panels/presentation/widgets/solar_panel_card.dart';

class AllPanelsSection extends StatelessWidget {
  AllPanelsSection({super.key});

  final List<Map<String, dynamic>> panels = [
    {
      'id': 'A100',
      'power': '12 kWh',
      'status': PanelStatus.healthy,
    },
    {
      'id': 'A101',
      'power': '12 kWh',
      'status': PanelStatus.poor,
    },
    {
      'id': 'A111',
      'power': '12 kWh',
      'status': PanelStatus.poor,
    },
    {
      'id': 'A110',
      'power': '12 kWh',
      'status': PanelStatus.healthy,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.sp,
          mainAxisSpacing: 16.sp,
          childAspectRatio: 4 / 3,
        ),
        itemCount: panels.length,
        itemBuilder: (context, index) {
          final panel = panels[index];
          final PanelStatus status = panel['status'];
          return SolarPanelCard(
            id: panel['id'],
            power: panel['power'],
            statusLabel: status.label,
            textColor: status.textColor,
            backgroundColor: status.backgroundColor,
          );
        },
      ),
    );
  }
}
