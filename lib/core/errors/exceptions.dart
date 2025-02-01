class ServerException implements Exception {
  final String message;
  final Map<String, dynamic>? errorMap;
  ServerException({
    this.errorMap,
    required this.message,
  });
}

class CacheException implements Exception {}
