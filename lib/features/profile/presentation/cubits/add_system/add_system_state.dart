part of 'add_system_cubit.dart';

sealed class AddSystemState extends Equatable {
  const AddSystemState();

  @override
  List<Object> get props => [];
}

final class AddSystemInitial extends AddSystemState {}

final class AddSystemLoading extends AddSystemState {}

final class AddSystemFailure extends AddSystemState {
  final String message;
  const AddSystemFailure({required this.message});
}

final class AddSystemSuccess extends AddSystemState {}
