import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:solari/core/errors/failures.dart';
import 'package:solari/core/widgets/toast.dart';
import 'package:solari/features/auth/domain/repositories/auth_repository.dart';
import '../../../../../injection_container.dart';
import '../../../domain/usecases/signup.dart';
import '../../pages/verify_otp/verify_otp_screen.dart';
part 'signup_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpUseCase signUpUseCase;
  SignUpCubit({required this.signUpUseCase}) : super(SignUpInitial());

  Future<void> signUpEvent({
    required String name,
    required String phone,
    required String password,
    required String confirmPassword,
  }) async {
    emit(SignUpLoading());
    final Either<Failure, Unit> response = await signUpUseCase(
      SignUpParams(
        name: name,
        phone: phone,
        password: password,
        confirmPassword: confirmPassword,
      ),
    );
    response.fold(
      (Failure failure) {
        emit(SignUpError(message: failure.message));
        showErrorToast(tr(failure.message));
      },
      (Unit verificationCodeResponse) {
        emit(SignUpSuccess());
        appNavigator.push(
          screen: OTPVerficationScreen(
              // isForgetPassword: false,
              // forceSendOTP: false,
              // phone: phone,
              ),
        );
      },
    );
  }
}
