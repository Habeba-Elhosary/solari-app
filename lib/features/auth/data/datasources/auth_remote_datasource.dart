import 'package:fpdart/fpdart.dart';
import 'package:solari/core/utils/app_api_base_helper/app_api_base_helper.dart';
import 'package:solari/features/auth/data/models/forget_password_response.dart';
import 'package:solari/features/auth/data/models/signin_response.dart';
import 'package:solari/features/auth/data/models/verify_otp_response.dart';
import 'package:solari/features/auth/domain/repositories/auth_repository.dart';

const String signInAPI = 'auth/sign/in';
const String forgetPasswordAPI = 'password/forgot';
const String sendOtpCodAPI = 'otp';
String verfiyCodeAPI(bool isForgetPassword) {
  String route = '';
  if (isForgetPassword) {
    route = 'password/verify-otp';
  } else {
    route = 'otp/verify';
  }
  return route;
}

const String signOutAPI = 'auth/sign/out';
const String createNewPasswordAPI = 'password/reset';

const String signUpAPI = '/client-api/v1/auth/register';
const String deleteAccountAPI = '/client-api/v1/auth/delete-account';

abstract class AuthRemoteDataSource {
  Future<SignInResponse> signIn(SignInParams params);
  Future<ForgetPasswordResponse> forgetPassword(ForgetPasswordParams params);
  Future<ForgetPasswordResponse> sendOTPCode();
  Future<VerifyOtpResponse> verfiyCode(VerifyCodeParams params);
  Future<Unit> signOut();

  Future<String> signUp(SignUpParams params);
  Future<Unit> deleteAccount();
  Future<Unit> createNewPassword(CreateNewPasswordParams params, String email);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiBaseHelper apiBaseHelper;
  AuthRemoteDataSourceImpl({required this.apiBaseHelper});

  @override
  Future<SignInResponse> signIn(SignInParams params) async {
    try {
      final dynamic response = await apiBaseHelper.post(
        url: signInAPI,
        body: params.toJson(),
      );
      apiBaseHelper.token = SignInResponse.fromJson(response).data?.token ?? '';
      return SignInResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<VerifyOtpResponse> verfiyCode(VerifyCodeParams params) async {
    try {
      final dynamic response = await apiBaseHelper.post(
          url: verfiyCodeAPI(params.isForgetPassword), body: params.toJson());
      return VerifyOtpResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> signUp(SignUpParams params) async {
    try {
      final dynamic response =
          await apiBaseHelper.post(url: signUpAPI, body: params.toJson());
      return response['data']['access_token'];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Unit> signOut() async {
    try {
      await apiBaseHelper.post(url: signOutAPI, body: {});
      return unit;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Unit> deleteAccount() async {
    try {
      await apiBaseHelper.delete(url: deleteAccountAPI);
      return unit;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Unit> createNewPassword(
      CreateNewPasswordParams params, String email) async {
    try {
      await apiBaseHelper.post(
        url: createNewPasswordAPI,
        body: {
          'email': email,
          ...params.toJson(),
        },
      );
      return unit;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ForgetPasswordResponse> forgetPassword(
      ForgetPasswordParams params) async {
    try {
      final dynamic response = await apiBaseHelper.post(
        url: forgetPasswordAPI,
        body: params.toJson(),
      );
      return ForgetPasswordResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ForgetPasswordResponse> sendOTPCode() async {
    try {
      final dynamic response = await apiBaseHelper.get(url: sendOtpCodAPI);
      return ForgetPasswordResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
