import 'package:fpdart/fpdart.dart';
import 'package:solari/core/errors/exceptions.dart';
import 'package:solari/core/errors/failures.dart';
import 'package:solari/features/general/data/datasources/general_remote_datasource.dart';
import 'package:solari/features/general/domain/entities/all_systems_response.dart';
import 'package:solari/features/general/domain/repositories/general_repository.dart';

class GeneralRepositoryImpl implements GeneralRepository {
  final GeneralRemoteDataSource globalRemoteDataSource;

  GeneralRepositoryImpl({required this.globalRemoteDataSource});
  @override
  Future<Either<Failure, AllSystemsResponse>> getAllSystems() async {
    try {
      final AllSystemsResponse employeeHomeResponse =
          await globalRemoteDataSource.getAllSystems();
      return right(employeeHomeResponse);
    } on ServerException catch (error) {
      return left(ServerFailure.formServerException(error));
    }
  }

  @override
  Future<Either<Failure, AllSystemsResponse>> getAllTechnicians() async {
    try {
      final AllSystemsResponse employeeHomeResponse =
          await globalRemoteDataSource.getAllTechnicians();
      return right(employeeHomeResponse);
    } on ServerException catch (error) {
      return left(ServerFailure.formServerException(error));
    }
  }
}
