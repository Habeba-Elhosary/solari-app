part of 'verfiy_code_cubit.dart';

sealed class VerfiyCodeState extends Equatable {
  const VerfiyCodeState();

  @override
  List<Object> get props => <Object>[];
}

final class VerfiyCodeInitial extends VerfiyCodeState {}

final class VerfiyCodeLoading extends VerfiyCodeState {}

final class VerfiyCodeSuccess extends VerfiyCodeState {}

final class VerfiyCodeError extends VerfiyCodeState {
  final String message;

  const VerfiyCodeError({required this.message});
}

