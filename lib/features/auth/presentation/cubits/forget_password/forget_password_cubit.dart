import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:solari/core/errors/failures.dart';
import 'package:solari/core/widgets/toast.dart';
import 'package:solari/features/auth/domain/repositories/auth_repository.dart';
import 'package:solari/features/auth/presentation/pages/verify_otp/verify_otp_screen.dart';
import 'package:solari/injection_container.dart';
import '../../../domain/entities/forget_password_reponse.dart';
import '../../../domain/entities/signin_response.dart';
import '../../../domain/usecases/forget_password.dart';
part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordUseCase forgetPassword;
  ForgetPasswordCubit({required this.forgetPassword})
      : super(FrogetPasswordInitial());

  String? phone;

  Future<void> forgetPasswordEvent({required String phone}) async {
    emit(ForgetPasswordLoading());

    final Either<Failure, ForgetPasswordResponse> response =
        await forgetPassword(ForgetPasswordParams(phone: phone));
    response.fold((Failure fail) {
      showErrorToast(fail.message);
      emit(FrogetPasswordError(message: fail.message));
    }, (ForgetPasswordResponse user) {
      emit(const ForgetPasswordHasInactiveUser());
      this.phone = phone;
      appNavigator.popToFirst();
      appNavigator.push(
          screen: OTPVerficationScreen(
        // phone: phone,
        // forceSendOTP: false,
        // isForgetPassword: true,
      ));
    });
  }

  void deleteNumber() {
    phone = null;
    emit(FrogetPasswordInitial());
  }
}
