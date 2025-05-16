import 'package:solari/features/home/data/datasources/home_remote_datasource.dart';
import 'package:solari/features/home/data/repositories/home_repository_impl.dart';
import 'package:solari/features/home/domain/repositories/home_repository.dart';
import 'package:solari/features/home/domain/usecases/get_system_home_usecase.dart';
import 'package:solari/features/home/presentation/cubitS/nav_bar/nav_bar_cubit.dart';
import 'package:solari/features/home/presentation/cubits/system_home/system_home_cubit.dart';
import '../../injection_container.dart';

void initHomeInjection() async {
  //* Cubits
  sl.registerLazySingleton<NavBarCubit>(() => NavBarCubit());
  sl.registerLazySingleton<SystemHomeCubit>(
    () => SystemHomeCubit(
      getSystemHome: sl(),
    ),
  );

  //* UseCases
  sl.registerLazySingleton(() => GetSystemHome(repository: sl()));

  //* Repositories
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(
      homeRemoteDataSource: sl(),
    ),
  );

  //* Data Sources
  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(
      apiBaseHelper: sl(),
    ),
  );
}
