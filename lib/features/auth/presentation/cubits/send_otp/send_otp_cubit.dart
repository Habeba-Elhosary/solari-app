import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:solari/core/errors/failures.dart';
import 'package:solari/core/usecases/no_params.dart';
import 'package:solari/features/auth/data/models/forget_password_response.dart';
import 'package:solari/features/auth/domain/usecases/send_otp_code.dart';
import '../verfiy_code/timer_verfiy_code.dart';
part 'send_otp_state.dart';

class SendOtpCubit extends Cubit<SendOtpState> {
  final SendOTPCodeUseCase sendOTPCodeUseCase;
  SendOtpCubit({required this.sendOTPCodeUseCase}) : super(SendOtpInitial());

  String? otpToken;

  Future<void> sendOTPEvent() async {
    emit(SendOtpLoading());
    final Either<Failure, ForgetPasswordResponse> response =
        await sendOTPCodeUseCase(NoParams());
    response.fold(
      (Failure failure) {
        emit(SendOtpError(message: failure.message));
      },
      (ForgetPasswordResponse response) {
        VerificatonCodeTimerStream.counterValue = 60;
        VerificatonCodeTimerStream.autoDecrement();
        otpToken = response.data?.otpToken;
        emit(SendOtpSuccess());
      },
    );
  }
}
