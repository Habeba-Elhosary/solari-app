import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solari/core/widgets/toast.dart';
import 'package:solari/features/profile/domain/repositories/profile_repository.dart';
import 'package:solari/features/profile/domain/usecases/add_system_usecase.dart';
import 'package:solari/injection_container.dart';
part 'add_system_state.dart';

class AddSystemCubit extends Cubit<AddSystemState> {
  final AddSystem addSystem;
  AddSystemCubit({required this.addSystem}) : super(AddSystemInitial());

  Future<void> addSystemEvent({
    required String systemName,
    required int systemId,
    required int technicianId,
    required String location,
  }) async {
    emit(AddSystemLoading());
    final result = await addSystem(
      AddSystemParams(
        systemName: systemName,
        systemId: systemId,
        technicianId: technicianId,
        location: location,
      ),
    );
    result.fold((failure) {
      emit(AddSystemFailure(message: failure.message));
      showErrorToast(failure.message);
    }, (r) {
      emit(AddSystemSuccess());
      showSuccessToast('test23');
      appNavigator.pop();
    });
  }
}
