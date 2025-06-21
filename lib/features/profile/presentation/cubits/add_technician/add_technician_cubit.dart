import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solari/core/widgets/toast.dart';
import 'package:solari/features/profile/domain/repositories/profile_repository.dart';
import 'package:solari/features/profile/domain/usecases/add_technician_usecase.dart';
import 'package:solari/injection_container.dart';
part 'add_technician_state.dart';

class AddTechnicianCubit extends Cubit<AddTechnicianState> {
  final AddTechnician addTechnician;
  AddTechnicianCubit({required this.addTechnician})
      : super(AddTechnicianInitial());

  Future<void> addTechnicianEvent({
    required String technicianName,
    required String technicianEmail,
    required String technicianPassword,
    required int systemId,
  }) async {
    emit(AddTechnicianLoading());
    final result = await addTechnician(
      AddTechnicianParams(
        name: technicianName,
        email: technicianEmail,
        password: technicianPassword,
        systemId: systemId,
      ),
    );
    result.fold((failure) {
      emit(AddTechnicianFailure(message: failure.message));
      showErrorToast(failure.message);
    }, (r) {
      emit(AddTechnicianSuccess());
      showSuccessToast('test2323');
      appNavigator.pop();
    });
  }
}
