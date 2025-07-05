import 'package:fpdart/fpdart.dart';
import 'package:solari/core/errors/exceptions.dart';
import 'package:solari/core/errors/failures.dart';
import 'package:solari/features/analytics/data/datasources/analytics_remote_datasource.dart';
import 'package:solari/features/analytics/domain/entities/all_analytics_response.dart';
import 'package:solari/features/analytics/domain/repositories/analytics_repositoy.dart';

class AnalyticsRepositoryImpl implements AnalyticsRepositoy {
  final AnalyticsRemoteDatasource analyticsRemoteDatasource;

  AnalyticsRepositoryImpl({required this.analyticsRemoteDatasource});
  @override
  Future<Either<Failure, AllAnalyticsResponse>> getAllAnalytics(
      AllAnalyticsParams params) async {
    try {
      final AllAnalyticsResponse response =
          await analyticsRemoteDatasource.getAllAnalytics(params);
      return right(response);
    } on ServerException catch (error) {
      return left(ServerFailure.formServerException(error));
    }
  }
}
