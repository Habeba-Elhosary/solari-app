import 'package:fpdart/fpdart.dart';
import 'package:solari/core/errors/failures.dart';
import 'package:solari/core/usecases/basic_usecase.dart';
import 'package:solari/core/usecases/no_params.dart';
import 'package:solari/features/auth/data/models/forget_password_response.dart';
import '../repositories/auth_repository.dart';

class SendOTPCodeUseCase extends UseCase<ForgetPasswordResponse, NoParams> {
  final AuthRepository authRepository;

  SendOTPCodeUseCase({required this.authRepository});

  @override
  Future<Either<Failure, ForgetPasswordResponse>> call(NoParams params) =>
      authRepository.sendOTPCode();
}
