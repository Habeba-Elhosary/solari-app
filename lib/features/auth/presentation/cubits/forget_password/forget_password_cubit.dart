import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:solari/core/errors/failures.dart';
import 'package:solari/core/widgets/toast.dart';
import 'package:solari/features/auth/data/models/forget_password_response.dart';
import 'package:solari/features/auth/domain/repositories/auth_repository.dart';
import 'package:solari/features/auth/presentation/cubits/verfiy_code/timer_verfiy_code.dart';
import '../../../domain/usecases/forget_password.dart';
part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordUseCase forgetPassword;
  ForgetPasswordCubit({required this.forgetPassword})
      : super(FrogetPasswordInitial());

  Future<void> forgetPasswordEvent({required String email}) async {
    emit(ForgetPasswordLoading());
    final Either<Failure, ForgetPasswordResponse> response =
        await forgetPassword(ForgetPasswordParams(email: email));
    response.fold((Failure fail) {
      showErrorToast(fail.message);
      emit(FrogetPasswordError(message: fail.message));
    }, (ForgetPasswordResponse response) {
      emit(ForgetPasswordSuccess(otpToken: response.data?.otpToken ?? ''));
      VerificatonCodeTimerStream.counterValue = 60;
      VerificatonCodeTimerStream.autoDecrement();
    });
  }
}
