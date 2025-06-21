part of 'add_panel_cubit.dart';

sealed class AddPanelState extends Equatable {
  const AddPanelState();

  @override
  List<Object> get props => [];
}

final class AddPanelInitial extends AddPanelState {}

final class AddPanelLoading extends AddPanelState {}

final class AddPanelSuccess extends AddPanelState {}

final class AddPanelFailure extends AddPanelState {
  final String message;
  const AddPanelFailure({required this.message});
}
