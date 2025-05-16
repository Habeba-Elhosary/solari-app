import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:solari/core/errors/failures.dart';
import 'package:solari/core/widgets/toast.dart';
import 'package:solari/features/auth/data/models/verify_otp_response.dart';
import 'package:solari/features/auth/domain/repositories/auth_repository.dart';
import '../../../../../injection_container.dart';
import '../../../domain/usecases/verfiy_code.dart';
import '../../pages/create_new_password/create_new_password_screen.dart';
import '../auto_signin/auto_signin_cubit.dart';
part 'verfiy_code_state.dart';

class VerfiyCodeCubit extends Cubit<VerfiyCodeState> {
  final VerfiyCodeUseCase verfiyCode;

  VerfiyCodeCubit({required this.verfiyCode}) : super(VerfiyCodeInitial());

  Future<void> verfiyCodeEvent({
    required String otp,
    required String otpToken,
    String? email,
    required bool isForgetPassword,
  }) async {
    emit(VerfiyCodeLoading());
    final Either<Failure, VerifyOtpResponse> response = await verfiyCode(
      VerifyCodeParams(
        otp: otp,
        otpToken: otpToken,
        email: email,
        isForgetPassword: isForgetPassword,
      ),
    );

    response.fold(
      (Failure failure) {
        emit(VerfiyCodeError(message: failure.message));
        showErrorToast(failure.message);
      },
      (VerifyOtpResponse success) {
        if (isForgetPassword) {
          appNavigator.pushReplacement(
              screen: CreateNewPasswordScreen(
                  resetToken: success.data?.resetToken ?? ''));
        } else {
          appNavigator.popToFirst();
          sl<AutoSignInCubit>().autoSignInEvent();
        }
        emit(VerfiyCodeSuccess());
      },
    );
  }
}
