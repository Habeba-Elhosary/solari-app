import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solari/core/usecases/no_params.dart';
import 'package:solari/features/home/domain/entities/get_system_home_response.dart';
import 'package:solari/features/home/domain/usecases/get_system_home_usecase.dart';
part 'system_home_state.dart';

class SystemHomeCubit extends Cubit<SystemHomeState> {
  final GetSystemHome getSystemHome;
  SystemHomeCubit({required this.getSystemHome}) : super(SystemHomeInitial());

  Future<void> getSystemHomeEvent() async {
    emit(SystemHomeLoading());
    final result = await getSystemHome(NoParams());
    result.fold(
      (failure) => emit(SystemHomeError(message: failure.message)),
      (response) => emit(SystemHomeSuccess(getSystemHomeResponse: response)),
    );
  }
}
