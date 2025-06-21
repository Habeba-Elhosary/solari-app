import 'package:solari/core/utils/app_api_base_helper/app_api_base_helper.dart';
import 'package:solari/features/home/domain/entities/get_system_home_response.dart';

const String systemHomeAPI = 'system/home/';

abstract class HomeRemoteDataSource {
  Future<GetSystemHomeResponse> getSystemHome({required int systemId});
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiBaseHelper apiBaseHelper;

  HomeRemoteDataSourceImpl({required this.apiBaseHelper});
  @override
  Future<GetSystemHomeResponse> getSystemHome({required int systemId}) async {
    try {
      final dynamic response = await apiBaseHelper.get(
        url: '$systemHomeAPI$systemId',
      );
      return GetSystemHomeResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
