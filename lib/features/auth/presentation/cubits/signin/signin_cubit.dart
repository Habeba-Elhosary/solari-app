import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:solari/core/errors/failures.dart';
import 'package:solari/core/widgets/toast.dart';
import 'package:solari/features/auth/domain/repositories/auth_repository.dart';
import 'package:solari/features/auth/presentation/pages/verify_otp/verify_otp_screen.dart';
import '../../../../../injection_container.dart';
import '../../../domain/entities/signin_response.dart';
import '../../../domain/usecases/signin.dart';
import '../auto_signin/auto_signin_cubit.dart';
part 'signin_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final SignInUseCase signInUseCase;

  SignInCubit({required this.signInUseCase}) : super(SignInInitial());

  late User _user;
  User get user => _user;
  set setUser(User user) => _user = user;

  Future<void> signInEvent({
    required String email,
    required String password,
  }) async {
    emit(SignInLoading());
    final Either<Failure, User> response = await signInUseCase(
      SignInParams(
        email: email,
        password: password,
      ),
    );
    response.fold((Failure failure) {
      emit(SignInError(message: failure.message));
      showErrorToast(tr(failure.message));
    }, (User user) {
      if (!user.isVerified) {
        appNavigator.push(
          screen: OTPVerficationScreen(
            phone: email,
            forceSendOTP: true,
            isForgetPassword: false,
          ),
        );
        return;
      }
      _user = user;
      emit(SignInSuccess());
      sl<AutoSignInCubit>().emitHasUserAsState();
    });
  }

  void emitUserVerified() {
    emit(SignInInitial());
    _user = _user.copyWith(isVerified: true);
    emit(SignInSuccess());
    sl<AutoSignInCubit>().emitHasUserAsState();
  }
}
