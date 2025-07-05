import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solari/features/analytics/domain/entities/all_analytics_response.dart';
import 'package:solari/features/analytics/domain/repositories/analytics_repositoy.dart';
import 'package:solari/features/analytics/domain/usecases/get_analytics_usecase.dart';
part 'analytics_state.dart';

class AnalyticsCubit extends Cubit<AnalyticsState> {
  final GetAnalyticsUsecase getAnalyticsUsecase;
  AnalyticsCubit({required this.getAnalyticsUsecase})
      : super(AnalyticsInitial());

  Future<void> getAllAnalyticsEvent() async {
    emit(AnalyticsLoading());
    final result = await getAnalyticsUsecase(
      AllAnalyticsParams(systemId: 1, panelId: 1),
    );
    result.fold((l) => emit(AnalyticsError(message: l.message)),
        (r) => emit(AnalyticsLoaded(allAnalyticsResponse: r)));
  }
}
