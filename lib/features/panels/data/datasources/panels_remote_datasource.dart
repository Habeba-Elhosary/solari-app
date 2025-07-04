import 'package:solari/core/utils/app_api_base_helper/app_api_base_helper.dart';
import 'package:solari/features/panels/domain/entities/all_panels_response.dart';

const String allPanelsAPI = 'system/';

abstract class PanelsRemoteDatasource {
  Future<AllPanelsResponse> getAllPanels(int systemId);
}

class PanelsRemoteDatasourceImpl implements PanelsRemoteDatasource {
  final ApiBaseHelper apiBaseHelper;

  PanelsRemoteDatasourceImpl({required this.apiBaseHelper});
  @override
  Future<AllPanelsResponse> getAllPanels(int systemId) async {
    try {
      final dynamic response = await apiBaseHelper.get(
        url: '$allPanelsAPI$systemId',
      );
      return AllPanelsResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
