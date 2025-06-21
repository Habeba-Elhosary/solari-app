part of 'add_technician_cubit.dart';

sealed class AddTechnicianState extends Equatable {
  const AddTechnicianState();

  @override
  List<Object> get props => [];
}

final class AddTechnicianInitial extends AddTechnicianState {}

final class AddTechnicianLoading extends AddTechnicianState {}

final class AddTechnicianSuccess extends AddTechnicianState {}

final class AddTechnicianFailure extends AddTechnicianState {
  final String message;
  const AddTechnicianFailure({required this.message});
}
