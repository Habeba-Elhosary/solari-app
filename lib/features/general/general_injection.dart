import 'package:solari/features/general/data/datasources/general_remote_datasource.dart';
import 'package:solari/features/general/data/repositories/general_repository_impl.dart';
import 'package:solari/features/general/domain/repositories/general_repository.dart';
import 'package:solari/features/general/domain/usecases/all_systems_usecase.dart';
import 'package:solari/features/general/domain/usecases/all_technicians_usecase.dart';
import 'package:solari/features/general/presentation/cubits/all_systems/all_systems_cubit.dart';
import 'package:solari/features/general/presentation/cubits/all_technicians/all_technicians_cubit.dart';
import 'package:solari/injection_container.dart';

void initGeneralInjection() async {
  //* Cubits
  sl.registerLazySingleton<AllSystemsCubit>(
      () => AllSystemsCubit(getAllSystems: sl()));
  sl.registerLazySingleton<AllTechniciansCubit>(
      () => AllTechniciansCubit(getAllTechnicians: sl()));

  //* UseCases
  sl.registerLazySingleton(() => GetAllSystems(repository: sl()));
  sl.registerLazySingleton(() => GetAllTechnicians(repository: sl()));

  //* Repositories
  sl.registerLazySingleton<GeneralRepository>(
    () => GeneralRepositoryImpl(
      globalRemoteDataSource: sl(),
    ),
  );

  //* Data Sources
  sl.registerLazySingleton<GeneralRemoteDataSource>(
    () => GeneralRemoteDataSourceImpl(apiBaseHelper: sl()),
  );
}
