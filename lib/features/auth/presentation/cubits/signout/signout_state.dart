part of 'signout_cubit.dart';

sealed class SignOutState extends Equatable {
  const SignOutState();

  @override
  List<Object> get props => <Object>[];
}

final class SignOutInitial extends SignOutState {}

final class SignOutLoading extends SignOutState {}

final class SignOutSuccess extends SignOutState {}

final class SignOutError extends SignOutState {
  final String message;

  const SignOutError({required this.message});
}

