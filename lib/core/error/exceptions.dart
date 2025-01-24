import '../util/api_basehelper.dart';

class ServerException implements Exception {
  final String message;
  final CodeStatus code;
  final Map<String, dynamic>? errorMap;
  ServerException({
    this.errorMap,
    required this.message,
    this.code = CodeStatus.defaultCode,
  });
}

class CacheException implements Exception {}

class AuthException implements Exception {
  final String message;
  AuthException({required this.message});
}

class UnauthorizedException implements Exception {
  final String message;
  UnauthorizedException({required this.message});
}

class NoCacheOrderException implements Exception {}

class CacheUserAcssesToken implements Exception {}

class ResetPasswordException implements Exception {}

class StatusException implements Exception {
  final String message;
  StatusException({required this.message});
}
