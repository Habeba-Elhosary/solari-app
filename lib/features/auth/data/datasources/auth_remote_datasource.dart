import 'dart:developer';
import 'package:fpdart/fpdart.dart';
import 'package:solari/core/utils/app_api_base_helper/app_api_base_helper.dart';
import 'package:solari/features/auth/domain/entities/signin_response.dart';
import 'package:solari/features/auth/domain/repositories/auth_repository.dart';
import '../../domain/entities/forget_password_reponse.dart';
import '../../domain/entities/verification_code_reponse.dart';

const String signUpAPI = '/client-api/v1/auth/register';
const String signInAPI = '/client-api/v1/auth/login';
const String signOutAPI = '/client-api/v1/auth/logout';
const String deleteAccountAPI = '/client-api/v1/auth/delete-account';
const String forgetPasswordAPI = '/client-api/v1/auth/forget-password';
const String sendOtpCodAPI = '/client-api/v1/auth/send-otp';
const String verfiyCodeAPI = '/client-api/v1/auth/verify-otp';
const String createNewPasswordAPI = '/client-api/v1/auth/reset-password';

abstract class AuthRemoteDataSource {
  Future<SignInResponse> signIn(SignInParams params);
  Future<String> signUp(SignUpParams params);
  Future<Unit> signOut();
  Future<Unit> deleteAccount();

  Future<ForgetPasswordResponse> forgetPassword(ForgetPasswordParams params);
  Future<Unit> verfiyCode(VerifyCodeParams params);
  Future<Unit> createNewPassword(CreateNewPasswordParams params);
  Future<VerificationCodeRepsonse> sendOTPCode(ForgetPasswordParams params);
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
      apiBaseHelper.token = SignInResponse.fromJson(response).data.accessToken;
      log(SignInResponse.fromJson(response).data.accessToken.toString());
      return SignInResponse.fromJson(response);
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
  Future<Unit> createNewPassword(CreateNewPasswordParams params) async {
    try {
      await apiBaseHelper.post(
        url: createNewPasswordAPI,
        body: params.toJson(),
      );
      return unit;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Unit> verfiyCode(VerifyCodeParams params) async {
    try {
      await apiBaseHelper.post(url: verfiyCodeAPI, body: params.toJson());
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
  Future<VerificationCodeRepsonse> sendOTPCode(
      ForgetPasswordParams params) async {
    try {
      final dynamic response =
          await apiBaseHelper.post(url: sendOtpCodAPI, body: params.toJson());
      return VerificationCodeRepsonse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
