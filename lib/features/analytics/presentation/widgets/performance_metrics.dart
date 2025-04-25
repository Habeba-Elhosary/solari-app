// ignore_for_file: library_private_types_in_public_api

import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solari/core/constants/app_colors.dart';
import 'package:solari/core/constants/app_fonts.dart';
import 'package:solari/core/constants/app_text_styles.dart';
import 'package:solari/core/widgets/app_spacer.dart';

class PerformanceMetricsChart extends StatefulWidget {
  const PerformanceMetricsChart({super.key});

  @override
  _PerformanceMetricsChartState createState() =>
      _PerformanceMetricsChartState();
}

class _PerformanceMetricsChartState extends State<PerformanceMetricsChart> {
  final List<FlSpot> actualSpots = [
    FlSpot(0, 2),
    FlSpot(1, 4),
    FlSpot(2, 3),
    FlSpot(3, 8),
    FlSpot(4, 4),
    FlSpot(5, 10),
    FlSpot(6, 7),
  ];

  final List<FlSpot> expectedSpots = [
    FlSpot(0, 6),
    FlSpot(1, 5),
    FlSpot(2, 7),
    FlSpot(3, 9.2),
    FlSpot(4, 6),
    FlSpot(5, 5),
    FlSpot(6, 6),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.sp),
      margin: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 8.sp),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.sp),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tr('performance_metrics'),
            style: TextStyles.semiBold20.copyWith(
              fontFamily: AppFonts.robotoSlab,
            ),
          ),
          AppSpacer(heightRatio: 0.5),
          Row(
            children: [
              _buildLegendItem(AppColors.primary, tr('actual')),
              SizedBox(width: 16.sp),
              _buildLegendItem(AppColors.red, tr('expected')),
            ],
          ),
          AppSpacer(heightRatio: 0.5),
          SizedBox(
            height: 250.sp,
            child: LineChart(
              LineChartData(
                minX: 0,
                maxX: 6,
                minY: 0,
                maxY: 12,
                gridData: FlGridData(show: false),
                borderData: FlBorderData(show: false),
                backgroundColor: Colors.white,
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 2,
                      reservedSize: 40.sp,
                      getTitlesWidget: (value, meta) => Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Text(
                          value.toInt().toString(),
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30.sp,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        const days = [
                          'Sat',
                          'Sun',
                          'Mon',
                          'Tue',
                          'Wed',
                          'Thu',
                          'Fri'
                        ];
                        int index = value.toInt();
                        if (index >= 0 && index < days.length) {
                          return Text(
                            days[index],
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.grey,
                            ),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                  topTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                lineBarsData: [
                  LineChartBarData(
                    spots: actualSpots,
                    isCurved: true,
                    color: AppColors.primary,
                    barWidth: 3,
                    dotData: FlDotData(show: false),
                  ),
                  LineChartBarData(
                    spots: expectedSpots,
                    isCurved: true,
                    color: AppColors.red,
                    barWidth: 3,
                    dotData: FlDotData(show: false),
                  ),
                ],
                lineTouchData: LineTouchData(
                  enabled: true,
                  handleBuiltInTouches: true,
                  touchTooltipData: LineTouchTooltipData(
                    tooltipRoundedRadius: 10.sp,
                    tooltipPadding:
                        EdgeInsets.symmetric(horizontal: 8.sp, vertical: 6.sp),
                    getTooltipItems: (touchedSpots) {
                      return touchedSpots.map((spot) {
                        return LineTooltipItem(
                          '${spot.y.toStringAsFixed(1)} kw',
                          TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      }).toList();
                    },
                  ),
                  getTouchedSpotIndicator: (barData, spotIndexes) {
                    return spotIndexes.map((index) {
                      return TouchedSpotIndicatorData(
                        FlLine(color: Colors.transparent),
                        FlDotData(
                          show: true,
                          getDotPainter: (spot, percent, barData, index) {
                            return FlDotCirclePainter(
                              radius: 5.sp,
                              color: barData.color!,
                              strokeWidth: 2,
                              strokeColor: Colors.white,
                            );
                          },
                        ),
                      );
                    }).toList();
                  },
                ),
                // belowBarData: BarChartData(
                //   barGroups: List.generate(
                //     7,
                //     (index) => BarChartGroupData(
                //       x: index,
                //       barRods: [
                //         BarChartRodData(
                //           y: 12,
                //           color: Colors.grey.withOpacity(0.3),
                //           width: 15.sp,
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 12.sp,
          height: 12.sp,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4.sp),
          ),
        ),
        SizedBox(width: 4.sp),
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
