import 'package:equatable/equatable.dart';
import 'package:firebase_notifications_handler/firebase_notifications_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:solari/core/errors/failures.dart';
import 'package:solari/core/utils/app_navigation/app_navigator.dart';
import 'package:solari/core/widgets/toast.dart';
import 'package:solari/features/auth/data/models/signin_response.dart';
import 'package:solari/features/auth/domain/repositories/auth_repository.dart';
import 'package:solari/features/auth/presentation/pages/verify_otp/verify_otp_screen.dart';
import 'package:solari/solari_app.dart';
import '../../../../../injection_container.dart';
import '../../../domain/usecases/signin.dart';
import '../auto_signin/auto_signin_cubit.dart';
part 'signin_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final SignInUseCase signInUseCase;

  SignInCubit({required this.signInUseCase}) : super(SignInInitial());

  late AuthData _user;
  AuthData get user => _user;
  set setUser(AuthData user) => _user = user;

  String? otpToken;

  void setOtpToken(String? token) {
    otpToken = token;
  }

  Future<void> signInEvent({
    required String email,
    required String password,
  }) async {
    emit(SignInLoading());
    await waitForFcmToken();
    final Either<Failure, SignInResponse> response = await signInUseCase(
      SignInParams(
        email: email,
        password: password,
        fcmToken: FirebaseNotificationsHandler.fcmToken ?? '',
      ),
    );
    response.fold((Failure failure) {
      emit(SignInError(message: failure.message));
      showErrorToast(failure.message);
    }, (SignInResponse response) {
      setOtpToken(response.data?.otpToken);

      if (response.data?.otpVerified == false) {
        appNavigator.push(
          screen: OTPVerficationScreen(
            isForgetPassword: false,
            otpToken: otpToken ?? '',
          ),
        );
        return;
      }
      _user = response.data!;
      emit(SignInSuccess());
      sl<AutoSignInCubit>().emitHasUserAsState();
      sl<AppNavigator>().navigatorKey.currentState?.pushAndRemoveUntil(
            MaterialPageRoute(builder: (_) => const SolariApp()),
            (route) => false,
          );
    });
  }
}

Future<void> waitForFcmToken({int maxRetries = 20}) async {
  int retries = 0;
  while ((FirebaseNotificationsHandler.fcmToken?.isEmpty ?? true) &&
      retries < maxRetries) {
    await Future.delayed(const Duration(milliseconds: 200));
    retries++;
  }
}
