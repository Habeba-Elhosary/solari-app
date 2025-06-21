import 'package:fpdart/fpdart.dart';
import 'package:solari/core/utils/app_api_base_helper/app_api_base_helper.dart';
import 'package:solari/features/profile/domain/repositories/profile_repository.dart';

const String addPanelAPI = 'system/cell';
const String addSystemAPI = 'system';
const String addTechnicianAPI = 'technician';

abstract class ProfileRemoteDataSource {
  Future<Unit> addPanel(AddPanelParams params);
  Future<Unit> addSystem(AddSystemParams params);
  Future<Unit> addTechnician(AddTechnicianParams params);
}

class ProfileRemoteDatasourceImpl implements ProfileRemoteDataSource {
  final ApiBaseHelper apiBaseHelper;

  ProfileRemoteDatasourceImpl({required this.apiBaseHelper});

  @override
  Future<Unit> addPanel(AddPanelParams params) async {
    try {
      await apiBaseHelper.post(
        url: addPanelAPI,
        body: params.toJson(),
      );
      return unit;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Unit> addSystem(AddSystemParams params) async {
    try {
      await apiBaseHelper.post(
        url: addSystemAPI,
        body: params.toJson(),
      );
      return unit;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Unit> addTechnician(AddTechnicianParams params) async {
    try {
      await apiBaseHelper.post(
        url: addTechnicianAPI,
        body: params.toJson(),
      );
      return unit;
    } catch (e) {
      rethrow;
    }
  }
}
