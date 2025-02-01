import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:solari/core/errors/exceptions.dart';
import 'package:solari/core/flavors/flavors_config.dart';

enum DataFormat { formData, rawData }

class ApiBaseHelper {
  final Dio dio;
  String? _token;

  ApiBaseHelper({required this.dio}) {
    dioInit();
  }

  // ================== Initialize DIO ======================
  void dioInit() {
    dio.options.baseUrl = FlavorConfig.instance.variables['baseUrl'];
    dio.options.headers = headers;
    dio.options.sendTimeout = const Duration(milliseconds: 30000);
    dio.options.connectTimeout = const Duration(milliseconds: 30000);
    dio.options.receiveTimeout = const Duration(milliseconds: 30000);

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

  // ================== Set Token and Headers ======================
  Map<String, String> headers = <String, String>{
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Accept-Language': 'ar',
  };

  set token(String? token) {
    _token = token;
    if (_token != null) {
      headers['Authorization'] = 'Bearer $_token';
    } else {
      headers.remove('Authorization');
    }
    dio.options.headers = headers;
  }

  // ================== GET Method ======================
  Future<dynamic> get({
    required String url,
    String? token,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      if (token != null) {
        this.token = token;
      }
      final Response response =
          await dio.get(url, data: body, queryParameters: queryParameters);
      final responseJson = _returnResponse(response);
      return responseJson;
    } on SocketException {
      throw ServerException(message: tr('error_no_internet'));
    } on DioException catch (e) {
      log(e.toString());
      log(e.response?.toString() ?? tr('no_response'));
      String message =
          e.response?.data['message'] ?? tr('error_please_try_again');
      if (e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.connectionTimeout) {
        message = tr('error_no_internet');
      }
      throw ServerException(message: message);
    }
  }

  // ================== POST Method ======================
  Future<dynamic> post({
    required String url,
    required Map<String, dynamic> body,
    String? token,
    DataFormat dataFormat = DataFormat.formData,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      if (token != null) {
        this.token = token;
      }
      final Response response;
      final dynamic responseJson;
      dynamic formattedBody;
      if (dataFormat == DataFormat.formData) {
        formattedBody = FormData.fromMap(body);
      } else {
        formattedBody = body;
      }
      response = await dio.post(url,
          data: formattedBody, queryParameters: queryParameters);
      responseJson = _returnResponse(response);
      return responseJson;
    } on SocketException {
      throw ServerException(message: tr('error_no_internet'));
    } on DioException catch (e) {
      log('DioException ----->$e');
      log('DioException ----->${e.response?.data}');
      return _returnResponse(e.response);
    }
  }

  // ================== PUT Method =========================
  Future<dynamic> put({
    required String url,
    String? token,
    Map<String, dynamic>? body,
  }) async {
    try {
      if (token != null) {
        this.token = token;
      }
      final Response response;
      if (body != null) {
        response = await dio.put(url, data: body);
      } else {
        response = await dio.put(url);
      }
      final responseJson = _returnResponse(response);
      return responseJson;
    } on SocketException {
      throw ServerException(message: tr('error_no_internet'));
    } on DioException catch (e) {
      log(e.toString());
      log(e.response?.toString() ?? 'no response');
      String message =
          e.response?.data['message'] ?? tr('error_please_try_again');
      if (e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.connectionTimeout) {
        message = tr('error_no_internet');
      }
      throw ServerException(message: message);
    }
  }

  // ================== DELETE Method ======================
  Future<dynamic> delete({required String url, String? token}) async {
    try {
      if (token != null) {
        this.token = token;
      }
      final Response response = await dio.delete(url);
      final responseJson = _returnResponse(response);
      return responseJson;
    } on SocketException {
      throw ServerException(message: tr('error_no_internet'));
    } on DioException catch (e) {
      log(e.toString());
      String message =
          e.response?.data['message'] ?? tr('error_please_try_again');
      if (e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.connectionTimeout) {
        message = tr('error_no_internet');
      }
      throw ServerException(message: message);
    }
  }

  // ================== Response Handling ======================
  dynamic _returnResponse(Response? response) {
    if (response == null) {
      throw ServerException(message: tr('error_no_internet'));
    }
    switch (response.statusCode) {
      case 200:
      case 201:
        return response.data;
      case 400:
      case 422:
        throw ServerException(
            message: response.data['message'],
            errorMap: response.data['errors']);
      case 401:
        throw ServerException(message: response.data['message'] ?? tr('error'));
      case 403:
        throw ServerException(message: response.data);
      case 500:
      default:
        throw ServerException(message: tr('error_no_internet'));
    }
  }
}

// ================== Exception Handling ======================
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
