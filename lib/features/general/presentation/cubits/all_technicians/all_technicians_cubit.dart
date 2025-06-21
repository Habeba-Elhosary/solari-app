import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'all_technicians_state.dart';

class AllTechniciansCubit extends Cubit<AllTechniciansState> {
  AllTechniciansCubit() : super(AllTechniciansInitial());
}
