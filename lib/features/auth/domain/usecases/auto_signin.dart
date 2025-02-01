import 'package:fpdart/fpdart.dart';
import 'package:solari/core/errors/failures.dart';
import 'package:solari/core/usecases/basic_usecase.dart';
import 'package:solari/core/usecases/no_params.dart';
import '../entities/signin_response.dart';
import '../repositories/auth_repository.dart';

class AutoSignInUseCase extends UseCase<User, NoParams> {
  final AuthRepository authRepository;

  AutoSignInUseCase({required this.authRepository});
  @override
  Future<Either<Failure, User>> call(NoParams params) {
    return authRepository.autoSignIn();
  }
}
