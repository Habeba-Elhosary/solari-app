import 'package:fpdart/fpdart.dart';
import 'package:solari/core/errors/failures.dart';
import 'package:solari/core/usecases/basic_usecase.dart';
import 'package:solari/features/analytics/domain/entities/all_analytics_response.dart';
import 'package:solari/features/analytics/domain/repositories/analytics_repositoy.dart';

class GetAnalyticsUsecase
    extends UseCase<AllAnalyticsResponse, AllAnalyticsParams> {
  final AnalyticsRepositoy repository;

  GetAnalyticsUsecase({required this.repository});
  @override
  Future<Either<Failure, AllAnalyticsResponse>> call(
          AllAnalyticsParams params) =>
      repository.getAllAnalytics(params);
}
