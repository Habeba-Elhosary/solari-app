part of 'panel_faults_cubit.dart';

sealed class PanelFaultsState extends Equatable {
  const PanelFaultsState();

  @override
  List<Object> get props => [];
}

final class PanelFaultsInitial extends PanelFaultsState {}

final class PanelFaultsLoading extends PanelFaultsState {}

final class PanelFaultsError extends PanelFaultsState {
  final String message;
  const PanelFaultsError({required this.message});
}

final class PanelFaultsSuccess extends PanelFaultsState {
  final List<Fault> faults;
  const PanelFaultsSuccess({required this.faults});
}
