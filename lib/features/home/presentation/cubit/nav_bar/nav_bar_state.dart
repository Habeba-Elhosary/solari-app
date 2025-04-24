part of 'nav_bar_cubit.dart';

class NavBarState extends Equatable {
  final int currentTab;

  const NavBarState({required this.currentTab});

  @override
  List<Object> get props => [currentTab];
}
