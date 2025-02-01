import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:solari/core/errors/failures.dart';
import 'package:solari/core/widgets/toast.dart';
import 'package:solari/features/auth/domain/repositories/auth_repository.dart';
import '../../../../../injection_container.dart';
import '../../../domain/usecases/verfiy_code.dart';
import '../../pages/create_new_password/create_new_password_screen.dart';
import '../auto_signin/auto_signin_cubit.dart';
part 'verfiy_code_state.dart';

class VerfiyCodeCubit extends Cubit<VerfiyCodeState> {
  final VerfiyCodeUseCase verfiyCode;

  VerfiyCodeCubit({required this.verfiyCode}) : super(VerfiyCodeInitial());

  Future<void> verfiyCodeEvent(
      {required String code, required bool isForgetPassword}) async {
    emit(VerfiyCodeLoading());
    final Either<Failure, Unit> response =
        await verfiyCode(VerifyCodeParams(code: code));

    response.fold(
      (Failure failure) {
        emit(VerfiyCodeError(message: failure.message));
        showErrorToast(tr(failure.message));
      },
      (Unit success) {
        showSuccessToast(tr('verified_successfully'));
        if (isForgetPassword) {
          appNavigator.pushReplacement(screen: const CreateNewPasswordScreen());
        } else {
          appNavigator.popToFirst();
          sl<AutoSignInCubit>().autoSignInEvent();
        }
        emit(VerfiyCodeSuccess());
      },
    );
  }
}
