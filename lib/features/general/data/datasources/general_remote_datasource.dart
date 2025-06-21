import 'package:solari/core/utils/app_api_base_helper/app_api_base_helper.dart';
import 'package:solari/features/general/domain/entities/all_systems_response.dart';

const String allSystemsAPI = 'system';
const String allTechniciansAPI = 'technician';

abstract class GeneralRemoteDataSource {
  Future<AllSystemsResponse> getAllSystems();
  Future<AllSystemsResponse> getAllTechnicians();
}

class GeneralRemoteDataSourceImpl implements GeneralRemoteDataSource {
  final ApiBaseHelper apiBaseHelper;

  GeneralRemoteDataSourceImpl({required this.apiBaseHelper});
  @override
  Future<AllSystemsResponse> getAllSystems() async {
    try {
      final dynamic response = await apiBaseHelper.get(
        url: allSystemsAPI,
      );
      return AllSystemsResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AllSystemsResponse> getAllTechnicians() async {
    try {
      final dynamic response = await apiBaseHelper.get(
        url: allTechniciansAPI,
      );
      return AllSystemsResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
