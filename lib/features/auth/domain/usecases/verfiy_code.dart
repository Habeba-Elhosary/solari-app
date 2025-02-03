import 'package:fpdart/fpdart.dart';
import 'package:solari/core/errors/failures.dart';
import 'package:solari/core/usecases/basic_usecase.dart';
import 'package:solari/features/auth/data/models/verify_otp_response.dart';
import '../repositories/auth_repository.dart';

class VerfiyCodeUseCase extends UseCase<VerifyOtpResponse, VerifyCodeParams> {
  final AuthRepository authRepository;

  VerfiyCodeUseCase({required this.authRepository});
  @override
  Future<Either<Failure, VerifyOtpResponse>> call(VerifyCodeParams params) =>
      authRepository.verifyCode(params);
}
