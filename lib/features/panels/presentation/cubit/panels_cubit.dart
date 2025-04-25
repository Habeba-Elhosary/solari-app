import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'panels_state.dart';

class PanelsCubit extends Cubit<PanelsState> {
  PanelsCubit() : super(PanelsInitial());
}
