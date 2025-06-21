import 'package:fpdart/fpdart.dart';
import 'package:solari/core/errors/failures.dart';
import 'package:solari/features/general/domain/entities/all_systems_response.dart';

abstract class GeneralRepository {
  Future<Either<Failure, AllSystemsResponse>> getAllSystems();
  Future<Either<Failure, AllSystemsResponse>> getAllTechnicians();
}
