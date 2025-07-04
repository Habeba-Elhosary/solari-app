import 'package:solari/features/panels/data/datasources/panels_remote_datasource.dart';
import 'package:solari/features/panels/data/repositories/panels_repository_impl.dart';
import 'package:solari/features/panels/domain/repositories/panels_repository.dart';
import 'package:solari/features/panels/domain/usecases/all_panels_usecase.dart';
import 'package:solari/features/panels/domain/usecases/panel_details_usecase.dart';
import 'package:solari/features/panels/domain/usecases/panel_faults_usecase.dart';
import 'package:solari/features/panels/presentation/cubits/all_panels/all_panels_cubit.dart';
import 'package:solari/features/panels/presentation/cubits/panel_details/panel_details_cubit.dart';
import 'package:solari/features/panels/presentation/cubits/panel_faults/panel_faults_cubit.dart';
import 'package:solari/injection_container.dart';

void initPanelsInjection() async {
  //* Cubits
  sl.registerLazySingleton<AllPanelsCubit>(
    () => AllPanelsCubit(
      allPanelsUsecase: sl(),
    ),
  );
  sl.registerFactory<PanelDetailsCubit>(
    () => PanelDetailsCubit(panelDetailsUsecase: sl()),
  );
  sl.registerFactory<PanelFaultsCubit>(
    () => PanelFaultsCubit(panelFaultsUsecase: sl()),
  );

  //* UseCases
  sl.registerLazySingleton(() => AllPanelsUsecase(repository: sl()));
  sl.registerLazySingleton(() => PanelDetailsUsecase(repository: sl()));
  sl.registerLazySingleton(() => PanelFaultsUsecase(repository: sl()));

  //* Repositories
  sl.registerLazySingleton<PanelsRepository>(
    () => PanelsRepositoryImpl(panelsRemoteDatasource: sl()),
  );

  //* Data Sources
  sl.registerLazySingleton<PanelsRemoteDatasource>(
    () => PanelsRemoteDatasourceImpl(apiBaseHelper: sl()),
  );
}
