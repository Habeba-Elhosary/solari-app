part of 'forget_password_cubit.dart';

sealed class ForgetPasswordState extends Equatable {
  const ForgetPasswordState();

  @override
  List<Object> get props => <Object>[];
}

final class FrogetPasswordInitial extends ForgetPasswordState {}

final class ForgetPasswordLoading extends ForgetPasswordState {}

final class ForgetPasswordSuccess extends ForgetPasswordState {
  final String otpToken;
  const ForgetPasswordSuccess({required this.otpToken});
}

final class FrogetPasswordError extends ForgetPasswordState {
  final String message;

  const FrogetPasswordError({required this.message});
}
