import 'package:fpdart/fpdart.dart';
import 'package:solari/core/errors/exceptions.dart';
import 'package:solari/core/errors/failures.dart';
import 'package:solari/features/home/data/datasources/home_remote_datasource.dart';
import 'package:solari/features/home/domain/entities/get_system_home_response.dart';
import 'package:solari/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImpl({required this.homeRemoteDataSource});
  @override
  Future<Either<Failure, GetSystemHomeResponse>> getSystemHome(
      {required int systemId}) async {
    try {
      final GetSystemHomeResponse employeeHomeResponse =
          await homeRemoteDataSource.getSystemHome(systemId: systemId);
      return right(employeeHomeResponse);
    } on ServerException catch (error) {
      return left(ServerFailure.formServerException(error));
    }
  }
}
