import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:solari/core/errors/failures.dart';
import 'package:solari/core/widgets/toast.dart';
import 'package:solari/features/auth/domain/repositories/auth_repository.dart';
import 'package:solari/injection_container.dart';
import '../../../domain/usecases/create_new_password.dart';
part 'create_new_password_state.dart';

class CreateNewPasswordCubit extends Cubit<CreateNewPasswordState> {
  final CreateNewPasswordUseCase createNewPasswordUseCase;
  CreateNewPasswordCubit({required this.createNewPasswordUseCase})
      : super(CreateNewPasswordInitial());

  Future<void> createNewPasswordEvent({
    required String password,
    required String confirmPassword,
  }) async {
    emit(CreateNewPasswordLoading());
    final Either<Failure, Unit> response = await createNewPasswordUseCase(
      CreateNewPasswordParams(
        password: password,
        confirmPassword: confirmPassword,
      ),
    );
    response.fold((Failure failure) {
      showErorrToast(tr(failure.message));
      emit(CreateNewPasswordError(message: failure.message));
    }, (Unit success) {
      showSuccessToast(tr('password_changed_successfully'));
      emit(CreateNewPasswordSucess());
      appNavigator.popToFirst();
    });
  }

  void showErorrToast(String tr) {}
}
