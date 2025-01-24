import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../error/exceptions.dart';
import '../flavors/flavors_config.dart';

const String googleServicesAPIKey = 'AIzaSyDuTp7RMNtSz-5z7h5utbygmA90E9enkUI';

enum CodeStatus { defaultCode, activation }

Map<String, String> headers = <String, String>{
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Lang': 'ar',
};

String baseUrl = FlavorConfig.instance.variables['baseUrl'];

class ApiBaseHelper {
  final Dio dio;

  ApiBaseHelper({required this.dio}) {
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
  }

  Future<dynamic> get({
    required String url,
    String? token,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
        dio.options.headers = headers;
      }

      log(url);
      final Response response =
          await dio.get(url, data: body, queryParameters: queryParameters);
      final responseJson = _returnResponse(response);
      log(responseJson.toString());
      return responseJson;
    } on Exception catch (error) {
      if (error is DioException && error.response != null) {
        _returnResponse(error.response);
      }
      throw ServerException(message: handleException(error));
    }
  }

  Future<dynamic> post({
    required String url,
    required Map<String, dynamic> body,
    String? token,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
        dio.options.headers = headers;
        log(baseUrl + url + token);
      } else {
        headers.remove('Authorization');
        dio.options.headers = headers;
      }
      log(url);
      log('body \n$body');
      log('headers \n${dio.options.headers}');
      FormData formData = FormData.fromMap(body);
      final Response response =
          await dio.post(url, data: formData, queryParameters: queryParameters);
      final responseJson = _returnResponse(response);
      log(responseJson.toString());
      return responseJson;
    } on Exception catch (error) {
      if (error is DioException && error.response != null) {
        _returnResponse(error.response);
      }
      throw ServerException(message: handleException(error));
    }
  }

  Future<dynamic> delete({required String url, String? token}) async {
    try {
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
        dio.options.headers = headers;
      }
      final Response response = await dio.delete(url);
      log(url);
      final responseJson = _returnResponse(response);
      log(responseJson.toString());
      return responseJson;
    } on Exception catch (error) {
      if (error is DioException && error.response != null) {
        _returnResponse(error.response);
      }
      throw ServerException(message: handleException(error));
    }
  }

  dynamic _returnResponse(Response? response) {
    if (response == null) {
      throw ServerException(
        message: tr('error_no_internet'),
      );
    }
    switch (response.statusCode) {
      case 200:
      case 201:
        return response.data;
      case 400:
        throw ServerException(
            message: response.data['message'],
            errorMap: response.data['errors']);
      case 422:
        throw ServerException(
            message: response.data['message'],
            errorMap: response.data['errors']);
      case 403:
      case 409:
      case 451:
      case 401:
        throw ServerException(message: response.data['message']);
      case 500:
      default:
        throw ServerException(message: tr('error_no_internet'));
    }
  }
}

String handleException(Exception error) {
  if (error.toString().contains('SocketException')) {
    return tr('please_check_your_internet_connection_and_try_again');
  } else if (error.runtimeType == DioException) {
    DioException dioError = error as DioException;
    switch (dioError.type) {
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionTimeout:
        return tr(
            'connection_timed_out_please_check_your_internet_speed_and_try_again');
      case DioExceptionType.badResponse:
        return dioError.response?.data['message'] ??
            tr('there_was_an_error_responding_please_try_again_later');
      case DioExceptionType.cancel:
        return tr('the_order_has_been_cancelled_please_try_again');
      case DioExceptionType.unknown:
      default:
        return tr('error_something_went_wrong');
    }
  } else {
    return tr('error_something_went_wrong');
  }
}

class AppException implements Exception {
  final String? _message;
  final String? _prefix;

  AppException([this._message, this._prefix]);
  @override
  String toString() {
    return '$_prefix$_message';
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message, '');
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, 'Invalid Request: ');
}

class UnAuthorizedException extends AppException {
  UnAuthorizedException([message]) : super(message, 'Unauthorized: ');
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, 'Invalid Input: ');
}
