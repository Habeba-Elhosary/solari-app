// ignore_for_file: deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solari/core/constants/app_colors.dart';
import 'package:solari/core/constants/app_fonts.dart';
import 'package:solari/core/constants/app_text_styles.dart';
import 'package:solari/core/widgets/app_spacer.dart';
import 'package:solari/features/analytics/presentation/widgets/time_filter.dart';

class GeneratingChart extends StatelessWidget {
  const GeneratingChart({super.key});

  @override
  Widget build(BuildContext context) {
    final List<FlSpot> spots = [
      FlSpot(0, 123),
      FlSpot(1, 600),
      FlSpot(2, 300),
      FlSpot(3, 450),
      FlSpot(4, 150),
      FlSpot(5, 625),
      FlSpot(6, 800),
      FlSpot(7, 349),
      FlSpot(8, 433),
      FlSpot(9, 777),
      FlSpot(10, 443),
      FlSpot(11, 566),
      FlSpot(12, 547),
      FlSpot(13, 234),
      FlSpot(14, 1000),
    ];

    final double maxY =
        (spots.map((e) => e.y).reduce((a, b) => a > b ? a : b) * 1.1);

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                tr('generating'),
                style: TextStyles.semiBold20.copyWith(
                  fontFamily: AppFonts.robotoSlab,
                ),
              ),
              TimeFilter(),
            ],
          ),
          AppSpacer(heightRatio: 0.2),
          SizedBox(
            height: 250.sp,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: 800.sp,
                child: LineChart(
                  LineChartData(
                    minX: 0,
                    maxY: maxY,
                    minY: 0,
                    backgroundColor: AppColors.white,
                    gridData: FlGridData(show: false),
                    borderData: FlBorderData(show: false),
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          interval: maxY / 6,
                          reservedSize: 40.sp,
                          getTitlesWidget: (value, meta) => Padding(
                            padding: EdgeInsets.only(right: 5.sp),
                            child: Text(
                              value.toInt().toString(),
                              style: TextStyles.regular12,
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
                            final int val = value.toInt();
                            if (val >= 0 && val <= 14) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: 5.sp),
                                child: Text(
                                  '${val.toString().padLeft(2, '0')}:00',
                                  style: TextStyles.regular12,
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
                        spots: spots,
                        isCurved: true,
                        color: AppColors.primary,
                        barWidth: 2.sp,
                        belowBarData: BarAreaData(
                          show: true,
                          gradient: LinearGradient(
                            colors: [
                              AppColors.primary.withOpacity(0.3),
                              AppColors.primary.withOpacity(0.0),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        dotData: FlDotData(
                          show: true,
                          getDotPainter: (spot, percent, barData, index) {
                            if (index == spots.length - 1) {
                              return FlDotCirclePainter(
                                radius: 4.sp,
                                color: AppColors.primary,
                                strokeWidth: 0,
                              );
                            }
                            return FlDotCirclePainter(radius: 0);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
