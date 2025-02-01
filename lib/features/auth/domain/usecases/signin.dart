import 'package:fpdart/fpdart.dart';
import 'package:solari/core/errors/failures.dart';
import 'package:solari/core/usecases/basic_usecase.dart';
import '../entities/signin_response.dart';
import '../repositories/auth_repository.dart';

class SignInUseCase extends UseCase<User, SignInParams> {
  final AuthRepository authRepository;

  SignInUseCase({required this.authRepository});
  @override
  Future<Either<Failure, User>> call(SignInParams params) =>
      authRepository.signIn(params);
}
