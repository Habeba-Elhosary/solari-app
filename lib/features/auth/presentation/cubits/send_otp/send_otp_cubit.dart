import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:solari/core/errors/failures.dart';
import 'package:solari/core/widgets/toast.dart';
import 'package:solari/features/auth/domain/entities/verification_code_reponse.dart';
import 'package:solari/features/auth/domain/repositories/auth_repository.dart';
import 'package:solari/features/auth/domain/usecases/send_otp_code.dart';
import '../verfiy_code/timer_verfiy_code.dart';
part 'send_otp_state.dart';

class SendOtpCubit extends Cubit<SendOtpState> {
  final SendOTPCodeUseCase sendOTPCodeUseCase;
  SendOtpCubit({required this.sendOTPCodeUseCase}) : super(SendOtpInitial());

  Future<void> sendOTP(String phone) async {
    emit(SendOtpLoading());
    final Either<Failure, VerificationCodeRepsonse> response =
        await sendOTPCodeUseCase(ForgetPasswordParams(phone: phone));
    response.fold(
      (Failure failure) {
        emit(SendOtpError(message: failure.message));
      },
      (VerificationCodeRepsonse verificationCodeRepsonse) {
        showSuccessToast(tr('otp_sent_successfully'));
        VerificatonCodeTimerStream.counterValue = 60;
        VerificatonCodeTimerStream.autoDecrement();
        emit(SendOtpSuccess(
          code: verificationCodeRepsonse.verificationCode,
        ));
      },
    );
  }
}
