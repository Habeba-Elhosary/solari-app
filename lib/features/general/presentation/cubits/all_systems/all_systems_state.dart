part of 'all_systems_cubit.dart';

sealed class AllSystemsState extends Equatable {
  const AllSystemsState();

  @override
  List<Object> get props => [];
}

final class AllSystemsInitial extends AllSystemsState {}

final class AllSystemsLoading extends AllSystemsState {}

final class AllSystemsLoaded extends AllSystemsState {
  final List<System> systems;
  const AllSystemsLoaded({required this.systems});
}

final class AllSystemsError extends AllSystemsState {
  final String message;
  const AllSystemsError({required this.message});
}
