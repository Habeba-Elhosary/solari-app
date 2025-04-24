import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solari/core/constants/app_assets.dart';
import 'package:solari/core/constants/app_colors.dart';
import 'package:solari/core/constants/app_fonts.dart';
import 'package:solari/core/constants/app_text_styles.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

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
              // TODO
              onTap: () {},
              child: SvgPicture.asset(AppAssets.notifications),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.sp),
          child: SingleChildScrollView(
            child: Column(
              children: [
                GenerationChart(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GenerationChart extends StatelessWidget {
  const GenerationChart({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data points for the chart (you can replace this with actual data)
    final List<FlSpot> spots = [
      FlSpot(0, 0),
      FlSpot(1, 600),
      FlSpot(2, 300),
      FlSpot(3, 450),
      FlSpot(4, 150),
      FlSpot(5, 625), // Last point (matches the 625 value in the image)
    ];

    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 8.sp), // Prevent shadow clipping
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.sp),
        color: Colors.white,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Generation',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: 12.sp, vertical: 6.sp),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(20.sp),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Day',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.blue,
                      ),
                    ),
                    Icon(
                      Icons.arrow_drop_up,
                      size: 20.sp,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.sp),
          SizedBox(
            height: 200.sp, // Adjust height as needed
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: false), // Hide grid lines
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40.w,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          value.toInt().toString(),
                          style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                        );
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        switch (value.toInt()) {
                          case 0:
                            return Text('00:00',
                                style: TextStyle(
                                    fontSize: 12.sp, color: Colors.grey));
                          case 1:
                            return Text('01:00',
                                style: TextStyle(
                                    fontSize: 12.sp, color: Colors.grey));
                          case 2:
                            return Text('02:00',
                                style: TextStyle(
                                    fontSize: 12.sp, color: Colors.grey));
                          case 3:
                            return Text('03:00',
                                style: TextStyle(
                                    fontSize: 12.sp, color: Colors.grey));
                          case 4:
                            return Text('04:00',
                                style: TextStyle(
                                    fontSize: 12.sp, color: Colors.grey));
                          case 5:
                            return Text('05:00',
                                style: TextStyle(
                                    fontSize: 12.sp, color: Colors.grey));
                          default:
                            return Text('');
                        }
                      },
                    ),
                  ),
                  topTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                borderData: FlBorderData(show: false), // Hide border
                lineBarsData: [
                  LineChartBarData(
                    spots: spots,
                    isCurved: true, // Smooth curve
                    color: Colors.blue, // Line color
                    barWidth: 2.sp,
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        colors: [
                          Colors.blue.withOpacity(0.2),
                          Colors.blue.withOpacity(0.0),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    dotData: FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, barData, index) {
                        if (index == spots.length - 1) {
                          // Show dot only for the last point
                          return FlDotCirclePainter(
                            radius: 4.sp,
                            color: Colors.blue,
                            strokeWidth: 0,
                          );
                        }
                        return FlDotCirclePainter(radius: 0); // Hide other dots
                      },
                    ),
                  ),
                ],
                extraLinesData: ExtraLinesData(
                  extraLinesOnTop: true,
                  horizontalLines: [],
                ),
                lineTouchData: LineTouchData(
                  enabled: false, // Disable touch interactions
                ),
                minX: 0,
                maxX: 5,
                minY: 0,
                maxY: 1150,
              ),
            ),
          ),
          // Tooltip-like label for the last point
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: EdgeInsets.only(right: 16.sp, top: 0),
              padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 4.sp),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10.sp),
              ),
              child: Text(
                '625',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
