import 'package:fpdart/fpdart.dart';
import 'package:solari/core/errors/failures.dart';
import 'package:solari/core/usecases/basic_usecase.dart';
import '../repositories/auth_repository.dart';

class SignUpUseCase extends UseCase<Unit, SignUpParams> {
  final AuthRepository authRepository;

  SignUpUseCase({required this.authRepository});
  @override
  Future<Either<Failure, Unit>> call(SignUpParams params) =>
      authRepository.signUp(params);
}
