part of 'auto_signin_cubit.dart';

abstract class AutoSignInState extends Equatable {
  const AutoSignInState();

  @override
  List<Object> get props => <Object>[];
}

class AutoSignInInitial extends AutoSignInState {}

class AutoSignInLoading extends AutoSignInState {}

class AutoSignInNoUser extends AutoSignInState {}

class AutoSignInHasUser extends AutoSignInState {}

class AutoSignInSeenIntro extends AutoSignInState {}

class AutoSignInError extends AutoSignInState {
  final String message;
  const AutoSignInError({required this.message});
}
