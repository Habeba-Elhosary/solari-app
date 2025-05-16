part of 'system_home_cubit.dart';

sealed class SystemHomeState extends Equatable {
  const SystemHomeState();

  @override
  List<Object> get props => [];
}

final class SystemHomeInitial extends SystemHomeState {}

final class SystemHomeLoading extends SystemHomeState {}

final class SystemHomeError extends SystemHomeState {
  final String message;
  const SystemHomeError({required this.message});
}

final class SystemHomeSuccess extends SystemHomeState {
  final GetSystemHomeResponse getSystemHomeResponse;
  const SystemHomeSuccess({required this.getSystemHomeResponse});
}
