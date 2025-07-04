part of 'all_technicians_cubit.dart';

sealed class AllTechniciansState extends Equatable {
  const AllTechniciansState();

  @override
  List<Object> get props => [];
}

final class AllTechniciansInitial extends AllTechniciansState {}

final class AllTechniciansLoading extends AllTechniciansState {}

final class AllTechniciansLoaded extends AllTechniciansState {
  final List<System> technicians;
  const AllTechniciansLoaded({required this.technicians});
}

final class AllTechniciansError extends AllTechniciansState {
  final String message;
  const AllTechniciansError({required this.message});
}
