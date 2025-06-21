import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solari/core/usecases/no_params.dart';
import 'package:solari/features/general/domain/entities/all_systems_response.dart';
import 'package:solari/features/general/domain/usecases/all_systems_usecase.dart';
part 'all_systems_state.dart';

class AllSystemsCubit extends Cubit<AllSystemsState> {
  final GetAllSystems getAllSystems;
  AllSystemsCubit({required this.getAllSystems}) : super(AllSystemsInitial());

  List<System> systems = [];

  Future<void> getAllSystemsEvent() async {
    emit(AllSystemsLoading());
    final result = await getAllSystems(NoParams());
    result.fold((failure) => emit(AllSystemsError(message: failure.message)),
        (data) {
      systems = data.data;
      emit(AllSystemsLoaded(systems: data.data));
    });
  }
}
