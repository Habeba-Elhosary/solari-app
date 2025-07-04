import 'package:solari/core/utils/app_api_base_helper/app_api_base_helper.dart';
import 'package:solari/features/panels/domain/entities/all_panels_response.dart';
import 'package:solari/features/panels/domain/entities/panel_details_response.dart';

const String allPanelsAPI = 'system/';
const String panelDetailsAPI = 'system/cell/';

abstract class PanelsRemoteDatasource {
  Future<AllPanelsResponse> getAllPanels(int systemId);
  Future<PanelDetailsResponse> getPanelDetails(int panelId);
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

  @override
  Future<PanelDetailsResponse> getPanelDetails(int panelId) async {
    try {
      final dynamic response = await apiBaseHelper.get(
        url: '$panelDetailsAPI$panelId',
      );
      return PanelDetailsResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
