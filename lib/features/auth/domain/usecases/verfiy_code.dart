import 'package:fpdart/fpdart.dart';
import 'package:solari/core/errors/failures.dart';
import 'package:solari/core/usecases/basic_usecase.dart';
import '../repositories/auth_repository.dart';

class VerfiyCodeUseCase extends UseCase<Unit, VerifyCodeParams> {
  final AuthRepository authRepository;

  VerfiyCodeUseCase({required this.authRepository});
  @override
  Future<Either<Failure, Unit>> call(VerifyCodeParams params) =>
      authRepository.verfiyCode(params);
}
