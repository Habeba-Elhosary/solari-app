import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solari/core/constants/app_colors.dart';
import 'package:solari/core/constants/app_fonts.dart';
import 'package:solari/core/constants/app_text_styles.dart';
import 'package:solari/features/analytics/presentation/pages/analytics_screen.dart';
import 'package:solari/features/auth/presentation/cubits/signin/signin_cubit.dart';
import 'package:solari/features/home/presentation/cubitS/nav_bar/nav_bar_cubit.dart';
import 'package:solari/features/home/presentation/cubits/system_home/system_home_cubit.dart';
import 'package:solari/features/home/presentation/pages/home_screen.dart';
import 'package:solari/features/panels/presentation/pages/panels_screen.dart';
import 'package:solari/features/profile/presentation/pages/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    context.read<SystemHomeCubit>().getSystemHomeEvent();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit, SignInState>(
      builder: (context, signInState) {
        return BlocBuilder<NavBarCubit, NavBarState>(
          builder: (context, state) {
            final navigationCubit = context.read<NavBarCubit>();
            return Scaffold(
              body: Builder(
                builder: (context) {
                  if (state.currentTab == 0) {
                    return HomeScreen();
                  }
                  if (state.currentTab == 1) {
                    return AnalyticsScreen();
                  }
                  if (state.currentTab == 2) {
                    return PanelsScreen();
                  }
                  if (state.currentTab == 3) {
                    return ProfileScreen();
                  }
                  return Container();
                },
              ),
              bottomNavigationBar: BottomNavigationBar(
                backgroundColor: AppColors.primary,
                type: BottomNavigationBarType.fixed,
                items: navigationCubit.userTabs,
                selectedItemColor: AppColors.white,
                unselectedItemColor: AppColors.white,
                unselectedLabelStyle:
                    TextStyles.regular14.copyWith(fontFamily: AppFonts.roboto),
                selectedLabelStyle:
                    TextStyles.regular14.copyWith(fontFamily: AppFonts.roboto),
                currentIndex: state.currentTab,
                onTap: (tab) {
                  navigationCubit.changeIndex(
                      tab: navigationCubit.userTabs[tab],
                      navTabs: navigationCubit.userTabs);
                },
              ),
            );
          },
        );
      },
    );
  }
}
