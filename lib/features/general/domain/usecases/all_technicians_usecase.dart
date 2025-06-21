import 'package:fpdart/fpdart.dart';
import 'package:solari/core/errors/failures.dart';
import 'package:solari/core/usecases/basic_usecase.dart';
import 'package:solari/core/usecases/no_params.dart';
import 'package:solari/features/general/domain/entities/all_systems_response.dart';
import 'package:solari/features/general/domain/repositories/general_repository.dart';

class GetAllTechnicians extends UseCase<AllSystemsResponse, NoParams> {
  final GeneralRepository repository;

  GetAllTechnicians({required this.repository});
  @override
  Future<Either<Failure, AllSystemsResponse>> call(NoParams params) =>
      repository.getAllTechnicians();
}
