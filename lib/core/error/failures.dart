import 'package:equatable/equatable.dart';
import '../../core/util/api_basehelper.dart';
import 'exceptions.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure({required this.message});
  @override
  List<Object> get props => <Object>[];
}

// General failures
class ServerFailure extends Failure {
  final CodeStatus code;
  final Map<String, dynamic>? errorMap;
  const ServerFailure({
    required super.message,
    this.errorMap,
    this.code = CodeStatus.defaultCode,
  });
  factory ServerFailure.formServerException(ServerException exception) {
    return ServerFailure(
      message: exception.message,
      errorMap: exception.errorMap,
      code: exception.code,
    );
  }
}

class CacheFailure extends Failure {
  const CacheFailure({required super.message});
}

class AddressFailure extends Failure {
  const AddressFailure({required super.message});
}

class AuthFailure extends Failure {
  const AuthFailure() : super(message: '');
}

class NoCachedUserFailure extends Failure {
  const NoCachedUserFailure({required super.message});
}
