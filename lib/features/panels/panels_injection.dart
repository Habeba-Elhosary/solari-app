import 'package:solari/features/panels/data/datasources/panels_remote_datasource.dart';
import 'package:solari/features/panels/data/repositories/panels_repository_impl.dart';
import 'package:solari/features/panels/domain/repositories/panels_repository.dart';
import 'package:solari/features/panels/domain/usecases/all_panels_usecase.dart';
import 'package:solari/features/panels/presentation/cubits/all_panels/all_panels_cubit.dart';
import 'package:solari/injection_container.dart';

void initPanelsInjection() async {
  //* Cubits
  sl.registerLazySingleton<AllPanelsCubit>(
    () => AllPanelsCubit(
      allPanelsUsecase: sl(),
    ),
  );

  //* UseCases
  sl.registerLazySingleton(() => AllPanelsUsecase(repository: sl()));

  //* Repositories
  sl.registerLazySingleton<PanelsRepository>(
    () => PanelsRepositoryImpl(panelsRemoteDatasource: sl()),
  );

  //* Data Sources
  sl.registerLazySingleton<PanelsRemoteDatasource>(
    () => PanelsRemoteDatasourceImpl(apiBaseHelper: sl()),
  );
}
