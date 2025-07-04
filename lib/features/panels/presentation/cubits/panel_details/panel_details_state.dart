part of 'panel_details_cubit.dart';

sealed class PanelDetailsState extends Equatable {
  const PanelDetailsState();

  @override
  List<Object> get props => [];
}

final class PanelDetailsInitial extends PanelDetailsState {}

final class PanelDetailsLoading extends PanelDetailsState {}

final class PanelDetailsError extends PanelDetailsState {
  final String message;
  const PanelDetailsError({required this.message});
}

final class PanelDetailsSuccess extends PanelDetailsState {
  final PanelDetailsResponse panelDetailsResponse;
  const PanelDetailsSuccess({required this.panelDetailsResponse});
}
