import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solari/core/widgets/single_drop_down_selector.dart';
import 'package:solari/features/general/domain/entities/all_systems_response.dart';
import 'package:solari/features/home/domain/entities/get_system_home_response.dart';
import 'package:solari/features/home/domain/usecases/get_system_home_usecase.dart';
part 'system_home_state.dart';

class SystemHomeCubit extends Cubit<SystemHomeState> {
  final GetSystemHome getSystemHome;
  SystemHomeCubit({required this.getSystemHome}) : super(SystemHomeInitial());

  System? system;

  void selectCompany({
    required BaseSelectableEntity entity,
  }) {
    emit(SystemHomeLoading());
    system = entity as System;
    getSystemHomeEvent();
    emit(SystemHomeInitial());
  }

  Future<void> getSystemHomeEvent() async {
    emit(SystemHomeLoading());
    final result = await getSystemHome(system!.id);
    result.fold(
      (failure) => emit(SystemHomeError(message: failure.message)),
      (response) => emit(SystemHomeSuccess(getSystemHomeResponse: response)),
    );
  }
}
