import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'all_technicians_state.dart';

class AllTechniciansCubit extends Cubit<AllTechniciansState> {
  AllTechniciansCubit() : super(AllTechniciansInitial());
}
