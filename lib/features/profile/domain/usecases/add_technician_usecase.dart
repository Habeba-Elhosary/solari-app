import 'package:fpdart/fpdart.dart';
import 'package:solari/core/errors/failures.dart';
import 'package:solari/core/usecases/basic_usecase.dart';
import 'package:solari/features/profile/domain/repositories/profile_repository.dart';

class AddTechnician extends UseCase<Unit, AddTechnicianParams> {
  final ProfileRepository repository;

  AddTechnician({required this.repository});
  @override
  Future<Either<Failure, Unit>> call(AddTechnicianParams params) =>
      repository.addTechnician(params);
}
