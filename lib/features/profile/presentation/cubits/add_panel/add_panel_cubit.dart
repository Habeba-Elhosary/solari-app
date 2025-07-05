import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:solari/core/widgets/single_drop_down_selector.dart';
import 'package:solari/core/widgets/toast.dart';
import 'package:solari/features/general/domain/entities/all_systems_response.dart';
import 'package:solari/features/profile/domain/repositories/profile_repository.dart';
import 'package:solari/features/profile/domain/usecases/add_panel_usecase.dart';
import 'package:solari/injection_container.dart';
part 'add_panel_state.dart';

class AddPanelCubit extends Cubit<AddPanelState> {
  final AddPanel addPanel;
  AddPanelCubit({required this.addPanel}) : super(AddPanelInitial());

  System? system;
  Position? position;

  void selectCompany({
    required BaseSelectableEntity entity,
  }) {
    emit(AddPanelLoading());
    system = entity as System;
    emit(AddPanelInitial());
  }

  void setPosition({
    required Position p,
  }) {
    emit(AddPanelLoading());
    position = p;
    emit(AddPanelInitial());
  }

  Future<void> addPanelEvent({
    required String name,
    required int panelId,
    required int maxCapacity,
  }) async {
    if (system == null || position == null) return;

    emit(AddPanelLoading());
    final result = await addPanel(
      AddPanelParams(
        panelName: name,
        panelId: panelId,
        systemId: system!.id,
        maxCapacity: maxCapacity,
        latitude: position!.latitude,
        longitude: position!.longitude,
      ),
    );
    result.fold((failure) {
      emit(AddPanelFailure(message: failure.message));
      showErrorToast(failure.message);
    }, (r) {
      emit(AddPanelSuccess());
      showSuccessToast(tr('panel_added_successfully'));
      appNavigator.pop();
    });
  }
}
