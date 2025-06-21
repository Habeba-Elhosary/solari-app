import 'package:fpdart/fpdart.dart';
import 'package:solari/core/errors/exceptions.dart';
import 'package:solari/core/errors/failures.dart';
import 'package:solari/features/profile/data/datasources/profile_remote_datasource.dart';
import 'package:solari/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource profileRemoteDataSource;

  ProfileRepositoryImpl({required this.profileRemoteDataSource});

  @override
  Future<Either<Failure, Unit>> addPanel(AddPanelParams params) async {
    try {
      await profileRemoteDataSource.addPanel(params);
      return right(unit);
    } on ServerException catch (error) {
      return left(ServerFailure.formServerException(error));
    }
  }

  @override
  Future<Either<Failure, Unit>> addSystem(AddSystemParams params) async {
    try {
      await profileRemoteDataSource.addSystem(params);
      return right(unit);
    } on ServerException catch (error) {
      return left(ServerFailure.formServerException(error));
    }
  }

  @override
  Future<Either<Failure, Unit>> addTechnician(
      AddTechnicianParams params) async {
    try {
      await profileRemoteDataSource.addTechnician(params);
      return right(unit);
    } on ServerException catch (error) {
      return left(ServerFailure.formServerException(error));
    }
  }
}
