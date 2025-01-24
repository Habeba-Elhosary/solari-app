// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

abstract class ApiResponse<T> {
  final bool? success;
  final String? message;
  final List<String>? errors;
  final int? status;

  ApiResponse({
    this.success,
    this.message,
    this.errors,
    this.status,
  });

  @override
  String toString() {
    return 'ApiResponse(success: $success, message: $message, errors: $errors, status: $status)';
  }

  @override
  bool operator ==(covariant ApiResponse<T> other) {
    if (identical(this, other)) return true;

    return other.success == success &&
        other.message == message &&
        listEquals(other.errors, errors) &&
        other.status == status;
  }

  @override
  int get hashCode {
    return success.hashCode ^
        message.hashCode ^
        errors.hashCode ^
        status.hashCode;
  }
}
