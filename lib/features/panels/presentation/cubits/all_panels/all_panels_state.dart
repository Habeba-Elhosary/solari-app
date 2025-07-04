part of 'all_panels_cubit.dart';

sealed class AllPanelsState extends Equatable {
  const AllPanelsState();

  @override
  List<Object> get props => [];
}

final class AllPanelsInitial extends AllPanelsState {}

final class AllPanelsLoading extends AllPanelsState {}

final class AllPanelsSuccess extends AllPanelsState {
  final AllPanelsResponse allPanelsResponse;
  const AllPanelsSuccess({required this.allPanelsResponse});
}

final class AllPanelsError extends AllPanelsState {
  final String message;
  const AllPanelsError({required this.message});
}
