import 'package:fpdart/fpdart.dart';
import 'package:solari/core/errors/failures.dart';
import 'package:solari/core/usecases/basic_usecase.dart';
import 'package:solari/features/profile/domain/repositories/profile_repository.dart';

class AddSystem extends UseCase<Unit, AddSystemParams> {
  final ProfileRepository repository;

  AddSystem({required this.repository});
  @override
  Future<Either<Failure, Unit>> call(AddSystemParams params) =>
      repository.addSystem(params);
}
