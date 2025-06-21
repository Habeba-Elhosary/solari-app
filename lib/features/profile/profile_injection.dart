import 'package:solari/features/profile/data/datasources/profile_remote_datasource.dart';
import 'package:solari/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:solari/features/profile/domain/repositories/profile_repository.dart';
import 'package:solari/features/profile/domain/usecases/add_panel_usecase.dart';
import 'package:solari/features/profile/domain/usecases/add_system_usecase.dart';
import 'package:solari/features/profile/domain/usecases/add_technician_usecase.dart';
import 'package:solari/features/profile/presentation/cubits/add_panel/add_panel_cubit.dart';
import 'package:solari/features/profile/presentation/cubits/add_system/add_system_cubit.dart';
import 'package:solari/features/profile/presentation/cubits/add_technician/add_technician_cubit.dart';
import 'package:solari/injection_container.dart';

void initProfileInjection() async {
  //* Cubits
  sl.registerFactory<AddPanelCubit>(() => AddPanelCubit(addPanel: sl()));
  sl.registerFactory<AddSystemCubit>(() => AddSystemCubit(addSystem: sl()));
  sl.registerFactory<AddTechnicianCubit>(
      () => AddTechnicianCubit(addTechnician: sl()));

  //* UseCases
  sl.registerLazySingleton(() => AddPanel(repository: sl()));
  sl.registerLazySingleton(() => AddSystem(repository: sl()));
  sl.registerLazySingleton(() => AddTechnician(repository: sl()));

  //* Repositories
  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(profileRemoteDataSource: sl()),
  );

  //* Data Sources
  sl.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDatasourceImpl(
      apiBaseHelper: sl(),
    ),
  );
}
