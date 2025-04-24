import 'package:solari/features/home/presentation/cubit/nav_bar/nav_bar_cubit.dart';

import '../../injection_container.dart';

void initHomeInjection() async {
  //* Cubits
  sl.registerLazySingleton<NavBarCubit>(() => NavBarCubit());

  //* UseCases

  //* Repositories

  //* Data Sources
}
