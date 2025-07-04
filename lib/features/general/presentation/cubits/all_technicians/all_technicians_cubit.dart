import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solari/core/usecases/no_params.dart';
import 'package:solari/features/general/domain/entities/all_systems_response.dart';
import 'package:solari/features/general/domain/usecases/all_technicians_usecase.dart';

part 'all_technicians_state.dart';

class AllTechniciansCubit extends Cubit<AllTechniciansState> {
  final GetAllTechnicians getAllTechnicians;
  AllTechniciansCubit({
    required this.getAllTechnicians,
  }) : super(AllTechniciansInitial());

  List<System> technicians = [];

  Future<void> getAllTechniciansEvent() async {
    emit(AllTechniciansLoading());
    final result = await getAllTechnicians(NoParams());
    result
        .fold((failure) => emit(AllTechniciansError(message: failure.message)),
            (data) {
      technicians = data.data;
      emit(AllTechniciansLoaded(technicians: data.data));
    });
  }
}
