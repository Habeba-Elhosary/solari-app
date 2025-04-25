import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'panels_state.dart';

class PanelsCubit extends Cubit<PanelsState> {
  PanelsCubit() : super(PanelsInitial());
}
