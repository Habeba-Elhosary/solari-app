import 'package:fpdart/fpdart.dart';
import 'package:solari/core/errors/failures.dart';
import 'package:solari/core/usecases/basic_usecase.dart';
import '../entities/forget_password_reponse.dart';
import '../repositories/auth_repository.dart';

class ForgetPasswordUseCase
    extends UseCase<ForgetPasswordResponse, ForgetPasswordParams> {
  final AuthRepository authRepository;

  ForgetPasswordUseCase({required this.authRepository});

  @override
  Future<Either<Failure, ForgetPasswordResponse>> call(
          ForgetPasswordParams params) =>
      authRepository.forgetPassword(params);
}
