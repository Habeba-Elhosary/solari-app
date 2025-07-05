// // ignore_for_file: library_private_types_in_public_api

// import 'package:easy_localization/easy_localization.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:solari/core/constants/app_colors.dart';
// import 'package:solari/core/constants/app_fonts.dart';
// import 'package:solari/core/constants/app_text_styles.dart';
// import 'package:solari/core/widgets/app_spacer.dart';
// import 'package:solari/features/analytics/domain/entities/all_analytics_response.dart';
// import 'package:solari/features/analytics/presentation/cubits/analytics_cubit.dart';

// class PerformanceMetricsChart extends StatefulWidget {
//   const PerformanceMetricsChart({super.key});

//   @override
//   _PerformanceMetricsChartState createState() =>
//       _PerformanceMetricsChartState();
// }

// class _PerformanceMetricsChartState extends State<PerformanceMetricsChart> {
//   List<FlSpot> _mapActualToSpots(List<Actual> list) {
//     const dayOrder = [
//       'Saturday',
//       'Sunday',
//       'Monday',
//       'Tuesday',
//       'Wednesday',
//       'Thursday',
//       'Friday'
//     ];

//     return list.map((item) {
//       final index = dayOrder.indexOf(item.x);
//       return FlSpot(index.toDouble(), item.y.toDouble());
//     }).toList()
//       ..sort((a, b) => a.x.compareTo(b.x));
//   }

//   double _getMaxY(List<FlSpot> spots) {
//     final max =
//         spots.map((e) => e.y).fold<double>(0, (prev, y) => y > prev ? y : prev);
//     return (max <= 10) ? 10 : (max + 2); // لزيادة مساحة y شوية
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(16.sp),
//       margin: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 8.sp),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20.r),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black12,
//             blurRadius: 4,
//             offset: Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             tr('performance_metrics'),
//             style: TextStyles.semiBold20.copyWith(
//               fontFamily: AppFonts.robotoSlab,
//             ),
//           ),
//           AppSpacer(heightRatio: 0.5),
//           Row(
//             children: [
//               _buildLegendItem(AppColors.primary, tr('actual')),
//               SizedBox(width: 16.sp),
//               _buildLegendItem(AppColors.red, tr('expected')),
//             ],
//           ),
//           AppSpacer(heightRatio: 0.5),
//           BlocBuilder<AnalyticsCubit, AnalyticsState>(
//             builder: (context, state) {
//               if (state is AnalyticsLoading) {
//                 return Shimmer.fromColors(
//                   baseColor: Colors.grey.shade300,
//                   highlightColor: Colors.grey.shade100,
//                   child: Container(
//                     height: 250.sp,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(4.r),
//                       color: Colors.grey.shade300,
//                     ),
//                   ),
//                 );
//               }
//               if (state is AnalyticsError) {
//                 return Center(child: Text(state.message));
//               }
//               if (state is AnalyticsLoaded) {
//                 final actualSpots = _mapActualToSpots(
//                     state.allAnalyticsResponse.data.powerChart.actual);
//                 final expectedSpots = _mapActualToSpots(
//                     state.allAnalyticsResponse.data.powerChart.expected);
//                 return SizedBox(
//                   height: 250.sp,
//                   child: LineChart(
//                     LineChartData(
//                       minX: 0,
//                       maxX: 6,
//                       minY: 0,
//                       maxY: _getMaxY(actualSpots + expectedSpots),
//                       gridData: FlGridData(show: false),
//                       borderData: FlBorderData(show: false),
//                       backgroundColor: Colors.white,
//                       titlesData: FlTitlesData(
//                         leftTitles: AxisTitles(
//                           sideTitles: SideTitles(
//                             showTitles: true,
//                             interval: 2,
//                             reservedSize: 40.sp,
//                             getTitlesWidget: (value, meta) => Padding(
//                               padding: const EdgeInsets.only(right: 8),
//                               child: Text(
//                                 value.toInt().toString(),
//                                 style: TextStyle(
//                                   fontSize: 12.sp,
//                                   color: Colors.grey,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         bottomTitles: AxisTitles(
//                           sideTitles: SideTitles(
//                             showTitles: true,
//                             reservedSize: 30.sp,
//                             interval: 1,
//                             getTitlesWidget: (value, meta) {
//                               const days = [
//                                 'Sat',
//                                 'Sun',
//                                 'Mon',
//                                 'Tue',
//                                 'Wed',
//                                 'Thu',
//                                 'Fri'
//                               ];
//                               int index = value.toInt();
//                               if (index >= 0 && index < days.length) {
//                                 return Text(
//                                   days[index],
//                                   style: TextStyle(
//                                     fontSize: 12.sp,
//                                     color: Colors.grey,
//                                   ),
//                                 );
//                               }
//                               return const SizedBox.shrink();
//                             },
//                           ),
//                         ),
//                         topTitles: AxisTitles(
//                             sideTitles: SideTitles(showTitles: false)),
//                         rightTitles: AxisTitles(
//                             sideTitles: SideTitles(showTitles: false)),
//                       ),
//                       lineBarsData: [
//                         LineChartBarData(
//                           spots: actualSpots,
//                           isCurved: true,
//                           color: AppColors.primary,
//                           barWidth: 3,
//                           dotData: FlDotData(show: false),
//                         ),
//                         LineChartBarData(
//                           spots: expectedSpots,
//                           isCurved: true,
//                           color: AppColors.red,
//                           barWidth: 3,
//                           dotData: FlDotData(show: false),
//                         ),
//                       ],
//                       lineTouchData: LineTouchData(
//                         enabled: true,
//                         handleBuiltInTouches: true,
//                         touchTooltipData: LineTouchTooltipData(
//                           tooltipRoundedRadius: 10.sp,
//                           tooltipPadding: EdgeInsets.symmetric(
//                               horizontal: 8.sp, vertical: 6.sp),
//                           getTooltipItems: (touchedSpots) {
//                             return touchedSpots.map((spot) {
//                               return LineTooltipItem(
//                                 '${spot.y.toStringAsFixed(1)} kw',
//                                 TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 12.sp,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               );
//                             }).toList();
//                           },
//                         ),
//                         getTouchedSpotIndicator: (barData, spotIndexes) {
//                           return spotIndexes.map((index) {
//                             return TouchedSpotIndicatorData(
//                               FlLine(color: Colors.transparent),
//                               FlDotData(
//                                 show: true,
//                                 getDotPainter: (spot, percent, barData, index) {
//                                   return FlDotCirclePainter(
//                                     radius: 5.sp,
//                                     color: barData.color!,
//                                     strokeWidth: 2,
//                                     strokeColor: Colors.white,
//                                   );
//                                 },
//                               ),
//                             );
//                           }).toList();
//                         },
//                       ),
//                     ),
//                   ),
//                 );
//               }
//               return const SizedBox.shrink();
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildLegendItem(Color color, String label) {
//     return Row(
//       children: [
//         Container(
//           width: 12.sp,
//           height: 12.sp,
//           decoration: BoxDecoration(
//             color: color,
//             borderRadius: BorderRadius.circular(4.sp),
//           ),
//         ),
//         SizedBox(width: 4.sp),
//         Text(
//           label,
//           style: TextStyle(
//             fontSize: 14.sp,
//             color: Colors.black,
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:solari/core/constants/app_colors.dart';
import 'package:solari/core/constants/app_fonts.dart';
import 'package:solari/core/constants/app_text_styles.dart';
import 'package:solari/core/widgets/app_spacer.dart';
import 'package:solari/features/analytics/domain/entities/all_analytics_response.dart';
import 'package:solari/features/analytics/presentation/cubits/analytics_cubit.dart';

class PerformanceMetricsChart extends StatelessWidget {
  const PerformanceMetricsChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.sp),
      margin: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 8.sp),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: const [
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
          BlocBuilder<AnalyticsCubit, AnalyticsState>(
            builder: (context, state) {
              if (state is AnalyticsLoading) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    height: 250.sp,
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
                final chartData = _prepareChartData(
                  state.allAnalyticsResponse.data.powerChart.actual,
                  state.allAnalyticsResponse.data.powerChart.expected,
                );
                return SizedBox(
                  height: 250.sp,
                  child: LineChart(
                    LineChartData(
                      minX: 0,
                      maxX: 6,
                      minY: 0,
                      maxY: chartData.maxY,
                      gridData: const FlGridData(show: false),
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
                              final index = value.toInt();
                              return index >= 0 && index < days.length
                                  ? Text(
                                      days[index],
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.grey,
                                      ),
                                    )
                                  : const SizedBox.shrink();
                            },
                          ),
                        ),
                        topTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        rightTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                      ),
                      lineBarsData: [
                        LineChartBarData(
                          spots: chartData.actualSpots,
                          isCurved: true,
                          color: AppColors.primary,
                          barWidth: 3,
                          dotData: const FlDotData(show: false),
                        ),
                        LineChartBarData(
                          spots: chartData.expectedSpots,
                          isCurved: true,
                          color: AppColors.red,
                          barWidth: 3,
                          dotData: const FlDotData(show: false),
                        ),
                      ],
                      lineTouchData: LineTouchData(
                        enabled: true,
                        handleBuiltInTouches: true,
                        touchTooltipData: LineTouchTooltipData(
                          tooltipRoundedRadius: 10.sp,
                          tooltipPadding: EdgeInsets.symmetric(
                            horizontal: 8.sp,
                            vertical: 6.sp,
                          ),
                          getTooltipItems: (touchedSpots) => touchedSpots
                              .map(
                                (spot) => LineTooltipItem(
                                  '${spot.y.toStringAsFixed(1)} kW',
                                  TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                              .toList(),
                          // getTouchedSpotIndicator: (barData, spotIndexes) =>
                          //     spotIndexes
                          //         .map(
                          //           (index) => TouchedSpotIndicatorData(
                          //             const FlLine(color: Colors.transparent),
                          //             FlDotData(
                          //               show: true,
                          //               getDotPainter: (spot, percent, barData, index) =>
                          //                   FlDotCirclePainter(
                          //                 radius: 5.sp,
                          //                 color: barData.color!,
                          //                 strokeWidth: 2,
                          //                 strokeColor: Colors.white,
                          //               ),
                          //             ),
                          //           ),
                          //         )
                          //         .toList(),
                        ),
                      ),
                    ),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }

  // دالة لإنشاء عنصر أسطورة (Legend)
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

  _ChartData _prepareChartData(List<Actual> actual, List<Actual> expected) {
    const dayOrder = [
      'Saturday',
      'Sunday',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday'
    ];

    final actualDays = actual.map((item) => item.x).toSet();
    final expectedDays = expected.map((item) => item.x).toSet();
    final commonDays = actualDays.intersection(expectedDays).toList()
      ..sort((a, b) => dayOrder.indexOf(a).compareTo(dayOrder.indexOf(b)));

    final actualSpots = <FlSpot>[];
    final expectedSpots = <FlSpot>[];
    for (var day in commonDays) {
      final index = dayOrder.indexOf(day).toDouble();
      final actualValue = actual
          .firstWhere(
            (item) => item.x == day,
            orElse: () => Actual(x: day, y: 0),
          )
          .y
          .toDouble();
      final expectedValue = expected
          .firstWhere(
            (item) => item.x == day,
            orElse: () => Actual(x: day, y: 0),
          )
          .y
          .toDouble();
      actualSpots.add(FlSpot(index, actualValue));
      expectedSpots.add(FlSpot(index, expectedValue));
    }

    final maxY = (actualSpots + expectedSpots)
        .map((spot) => spot.y)
        .fold<double>(0, (prev, y) => y > prev ? y : prev);
    return _ChartData(
      actualSpots: actualSpots,
      expectedSpots: expectedSpots,
      maxY: maxY <= 10 ? 10 : maxY + 2,
    );
  }
}

class _ChartData {
  final List<FlSpot> actualSpots;
  final List<FlSpot> expectedSpots;
  final double maxY;

  _ChartData({
    required this.actualSpots,
    required this.expectedSpots,
    required this.maxY,
  });
}
