import 'package:solari/features/analytics/data/datasources/analytics_remote_datasource.dart';
import 'package:solari/features/analytics/data/repositories/analytics_repository_impl.dart';
import 'package:solari/features/analytics/domain/repositories/analytics_repositoy.dart';
import 'package:solari/features/analytics/domain/usecases/get_analytics_usecase.dart';
import 'package:solari/features/analytics/presentation/cubits/analytics_cubit.dart';
import 'package:solari/injection_container.dart';

void initAnalyticsInjection() async {
  //* Cubits
  sl.registerFactory<AnalyticsCubit>(
    () => AnalyticsCubit(
      getAnalyticsUsecase: sl(),
    ),
  );

  //* UseCases
  sl.registerLazySingleton(() => GetAnalyticsUsecase(repository: sl()));

  //* Repositories
  sl.registerLazySingleton<AnalyticsRepositoy>(
    () => AnalyticsRepositoryImpl(analyticsRemoteDatasource: sl()),
  );

  //* Data Sources
  sl.registerLazySingleton<AnalyticsRemoteDatasource>(
    () => AnalyticsRemoteDatasourceImpl(apiBaseHelper: sl()),
  );
}
