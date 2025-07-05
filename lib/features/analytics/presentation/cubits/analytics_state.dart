part of 'analytics_cubit.dart';

abstract class AnalyticsState extends Equatable {
  const AnalyticsState();

  @override
  List<Object> get props => [];
}

class AnalyticsInitial extends AnalyticsState {}

class AnalyticsLoading extends AnalyticsState {}

class AnalyticsLoaded extends AnalyticsState {
  final AllAnalyticsResponse allAnalyticsResponse;
  const AnalyticsLoaded({required this.allAnalyticsResponse});
}

class AnalyticsError extends AnalyticsState {
  final String message;
  const AnalyticsError({required this.message});
}
