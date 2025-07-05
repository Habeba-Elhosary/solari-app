import 'package:fpdart/fpdart.dart';
import 'package:solari/core/errors/failures.dart';
import 'package:solari/features/analytics/domain/entities/all_analytics_response.dart';

abstract class AnalyticsRepositoy {
  Future<Either<Failure, AllAnalyticsResponse>> getAllAnalytics(
      AllAnalyticsParams params);
}

class AllAnalyticsParams {
  final int systemId;
  final int panelId;
  const AllAnalyticsParams({
    required this.systemId,
    required this.panelId,
  });
}
