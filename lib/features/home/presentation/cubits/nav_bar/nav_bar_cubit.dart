import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solari/core/constants/app_assets.dart';
part 'nav_bar_state.dart';

class NavBarCubit extends Cubit<NavBarState> {
  NavBarCubit() : super(const NavBarState(currentTab: 0));

  List<BottomNavigationBarItem> userTabs = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        AppAssets.home,
      ),
      activeIcon: SvgPicture.asset(AppAssets.homeBold),
      label: tr('home'),
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(AppAssets.analytics),
      activeIcon: SvgPicture.asset(AppAssets.analyticsBold),
      label: tr('analytics'),
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(AppAssets.panels),
      activeIcon: SvgPicture.asset(AppAssets.panelsBold),
      label: tr('panels'),
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(AppAssets.profile),
      activeIcon: SvgPicture.asset(AppAssets.profileBold),
      label: tr('profile'),
    ),
  ];

  void changeIndex({
    required BottomNavigationBarItem tab,
    required List<BottomNavigationBarItem> navTabs,
  }) {
    emit(NavBarState(currentTab: navTabs.indexOf(tab)));
  }

  bool isCurrentTab({
    required BottomNavigationBarItem bottomNavigationBarItem,
    required List<BottomNavigationBarItem> navTabs,
  }) =>
      navTabs.indexOf(bottomNavigationBarItem) == state.currentTab;

  void updateIndex(int tab) {
    emit(NavBarState(currentTab: tab));
  }
}
