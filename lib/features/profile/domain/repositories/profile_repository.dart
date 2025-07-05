import 'package:fpdart/fpdart.dart';
import 'package:solari/core/errors/failures.dart';

abstract class ProfileRepository {
  Future<Either<Failure, Unit>> addPanel(AddPanelParams params);
  Future<Either<Failure, Unit>> addSystem(AddSystemParams params);
  Future<Either<Failure, Unit>> addTechnician(AddTechnicianParams params);
}

class AddPanelParams {
  final String panelName;
  final int panelId;
  final int systemId;
  final int maxCapacity;
  final double latitude;
  final double longitude;

  AddPanelParams(
      {required this.panelName,
      required this.panelId,
      required this.systemId,
      required this.maxCapacity,
      required this.latitude,
      required this.longitude});

  Map<String, dynamic> toJson() {
    return {
      'name': panelName,
      'cell_id': panelId,
      'system_id': systemId,
      'max_capacity': maxCapacity,
      'lat': latitude,
      'long': longitude
    };
  }
}

class AddSystemParams {
  final String systemName;
  final int systemId;
  final String location;
  final int technicianId;

  AddSystemParams({
    required this.systemName,
    required this.location,
    required this.technicianId,
    required this.systemId,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': systemName,
      'system_id': systemId,
      'location': location,
      'user_id': technicianId
    };
  }
}

class AddTechnicianParams {
  final String name;
  final String email;
  final String password;

  AddTechnicianParams({
    required this.name,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }
}
