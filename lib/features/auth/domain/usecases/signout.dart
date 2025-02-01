import 'package:fpdart/fpdart.dart';
import 'package:solari/core/errors/failures.dart';
import 'package:solari/core/usecases/basic_usecase.dart';
import 'package:solari/core/usecases/no_params.dart';
import '../repositories/auth_repository.dart';

class SignOutUseCase extends UseCase<Unit, NoParams> {
  final AuthRepository authRepository;

  SignOutUseCase({required this.authRepository});
  @override
  Future<Either<Failure, Unit>> call(NoParams params) =>
      authRepository.signOut();
}
