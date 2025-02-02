import 'package:fpdart/fpdart.dart';
import 'package:solari/core/errors/failures.dart';
import 'package:solari/core/usecases/basic_usecase.dart';
import 'package:solari/core/usecases/no_params.dart';
import 'package:solari/features/auth/data/models/signin_response.dart';
import '../repositories/auth_repository.dart';

class AutoSignInUseCase extends UseCase<SignInResponse, NoParams> {
  final AuthRepository authRepository;

  AutoSignInUseCase({required this.authRepository});
  @override
  Future<Either<Failure, SignInResponse>> call(NoParams params) {
    return authRepository.autoSignIn();
  }
}
