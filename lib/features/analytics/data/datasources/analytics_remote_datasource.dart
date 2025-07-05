import 'package:solari/core/utils/app_api_base_helper/app_api_base_helper.dart';
import 'package:solari/features/analytics/domain/entities/all_analytics_response.dart';
import 'package:solari/features/analytics/domain/repositories/analytics_repositoy.dart';

String analyticsAPI(int systemId, int panelId) =>
    'system/home/$systemId/$panelId';

abstract class AnalyticsRemoteDatasource {
  Future<AllAnalyticsResponse> getAllAnalytics(AllAnalyticsParams params);
}

class AnalyticsRemoteDatasourceImpl implements AnalyticsRemoteDatasource {
  final ApiBaseHelper apiBaseHelper;

  AnalyticsRemoteDatasourceImpl({required this.apiBaseHelper});
  @override
  Future<AllAnalyticsResponse> getAllAnalytics(
      AllAnalyticsParams params) async {
    try {
      final dynamic response = await apiBaseHelper.get(
        url: analyticsAPI(params.systemId, params.panelId),
      );
      return AllAnalyticsResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
