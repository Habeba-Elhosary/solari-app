import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solari/core/widgets/single_drop_down_selector.dart';
import 'package:solari/features/general/domain/entities/all_systems_response.dart';
import 'package:solari/features/panels/domain/entities/all_panels_response.dart';
import 'package:solari/features/panels/domain/usecases/all_panels_usecase.dart';
part 'all_panels_state.dart';

class AllPanelsCubit extends Cubit<AllPanelsState> {
  final AllPanelsUsecase allPanelsUsecase;
  AllPanelsCubit({required this.allPanelsUsecase}) : super(AllPanelsInitial());

  System? system;

  void selectSystem({
    required BaseSelectableEntity entity,
  }) {
    emit(AllPanelsInitial());
    system = entity as System;
    getAllPanelsEvent();
    emit(AllPanelsLoading());
  }

  Future<void> getAllPanelsEvent() async {
    if (system == null) return;
    emit(AllPanelsLoading());
    final result = await allPanelsUsecase(system!.id);
    result.fold(
      (failure) => emit(AllPanelsError(message: failure.message)),
      (response) => emit(AllPanelsSuccess(allPanelsResponse: response)),
    );
  }
}
