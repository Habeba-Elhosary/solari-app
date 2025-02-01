import 'package:equatable/equatable.dart';
import 'package:solari/core/errors/exceptions.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure({required this.message});
  @override
  List<Object> get props => <Object>[];
}

class ServerFailure extends Failure {
  final Map<String, dynamic>? errorMap;
  const ServerFailure({
    required super.message,
    this.errorMap,
  });
  factory ServerFailure.formServerException(ServerException exception) {
    return ServerFailure(
      message: exception.message,
      errorMap: exception.errorMap,
    );
  }
}

class CacheFailure extends Failure {
  const CacheFailure({required super.message});
}
