import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solari/features/panels/domain/entities/panel_details_response.dart';
import 'package:solari/features/panels/domain/usecases/panel_details_usecase.dart';
part 'panel_details_state.dart';

class PanelDetailsCubit extends Cubit<PanelDetailsState> {
  final PanelDetailsUsecase panelDetailsUsecase;
  PanelDetailsCubit({required this.panelDetailsUsecase})
      : super(PanelDetailsInitial());

  Future<void> getPanelDetailsEvent({required int panelId}) async {
    emit(PanelDetailsLoading());
    final result = await panelDetailsUsecase(panelId);
    result.fold((l) => emit(PanelDetailsError(message: l.message)),
        (r) => emit(PanelDetailsSuccess(panelDetailsResponse: r)));
  }
}
