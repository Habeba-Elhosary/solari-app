import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solari/features/panels/domain/entities/panel_details_response.dart';
import 'package:solari/features/panels/domain/usecases/panel_faults_usecase.dart';
part 'panel_faults_state.dart';

class PanelFaultsCubit extends Cubit<PanelFaultsState> {
  final PanelFaultsUsecase panelFaultsUsecase;
  PanelFaultsCubit({required this.panelFaultsUsecase})
      : super(PanelFaultsInitial());

  Future<void> getPanelFaultsEvent(int panelId) async {
    emit(PanelFaultsLoading());
    final failureOrPanelFaults = await panelFaultsUsecase(panelId);
    failureOrPanelFaults.fold(
      (failure) => emit(PanelFaultsError(message: failure.message)),
      (panelFaults) => emit(PanelFaultsSuccess(faults: panelFaults.data)),
    );
  }
}
