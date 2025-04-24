import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solari/core/widgets/app_spacer.dart';
import 'package:solari/features/home/presentation/widgets/home_header.dart';
import 'package:solari/features/home/presentation/widgets/home_panels_section.dart';
import 'package:solari/features/home/presentation/widgets/home_power_section.dart';
import 'package:solari/features/home/presentation/widgets/home_temperature_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 16.sp),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.sp),
                  child: HomeHeader(),
                ),
                AppSpacer(heightRatio: 0.7),
                HomePowerSection(),
                AppSpacer(heightRatio: 0.7),
                HomePanelsSection(),
                AppSpacer(heightRatio: 0.7),
                HomeTemperatureSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
