import 'package:fpdart/fpdart.dart';
import 'package:solari/core/errors/exceptions.dart';
import 'package:solari/core/errors/failures.dart';
import 'package:solari/features/panels/data/datasources/panels_remote_datasource.dart';
import 'package:solari/features/panels/domain/entities/all_panels_response.dart';
import 'package:solari/features/panels/domain/repositories/panels_repository.dart';

class PanelsRepositoryImpl implements PanelsRepository {
  final PanelsRemoteDatasource panelsRemoteDatasource;

  PanelsRepositoryImpl({required this.panelsRemoteDatasource});
  @override
  Future<Either<Failure, AllPanelsResponse>> getAllPanels(int systemId) async {
    try {
      final AllPanelsResponse response =
          await panelsRemoteDatasource.getAllPanels(systemId);
      return right(response);
    } on ServerException catch (error) {
      return left(ServerFailure.formServerException(error));
    }
  }
}
