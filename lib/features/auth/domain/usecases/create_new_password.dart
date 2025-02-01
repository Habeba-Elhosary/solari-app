import 'package:fpdart/fpdart.dart';
import 'package:solari/core/errors/failures.dart';
import 'package:solari/core/usecases/basic_usecase.dart';
import '../repositories/auth_repository.dart';

class CreateNewPasswordUseCase extends UseCase<Unit, CreateNewPasswordParams> {
  final AuthRepository authRepository;

  CreateNewPasswordUseCase({required this.authRepository});
  @override
  Future<Either<Failure, Unit>> call(CreateNewPasswordParams params) =>
      authRepository.createNewPassword(params);
}
