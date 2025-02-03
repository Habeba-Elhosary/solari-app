import 'package:fpdart/fpdart.dart';
import 'package:solari/core/errors/failures.dart';
import 'package:solari/features/auth/data/models/forget_password_response.dart';
import 'package:solari/features/auth/data/models/signin_response.dart';
import 'package:solari/features/auth/data/models/verify_otp_response.dart';

abstract class AuthRepository {
  Future<Either<Failure, SignInResponse>> signIn(SignInParams params);
  Future<Either<Failure, SignInResponse>> autoSignIn();
  Future<Either<Failure, ForgetPasswordResponse>> forgetPassword(
      ForgetPasswordParams params);
  Future<Either<Failure, ForgetPasswordResponse>> sendOTPCode();
  Future<Either<Failure, VerifyOtpResponse>> verifyCode(
      VerifyCodeParams params);
  Future<Either<Failure, Unit>> signOut();

  Future<Either<Failure, Unit>> signUp(SignUpParams params);
  Future<Either<Failure, Unit>> deleteAccount();
  Future<Either<Failure, Unit>> createNewPassword(
      CreateNewPasswordParams params);
}

// ======================= SIGN IN PARAMS ==========================
class SignInParams {
  final String email;
  final String password;
  SignInParams({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }
}

// ======================= FORGET PASSWORD PARAMS ==========================
class ForgetPasswordParams {
  final String email;
  ForgetPasswordParams({required this.email});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
    };
  }
}

// ======================= VERIFY CODE PARAMS ==========================
class VerifyCodeParams {
  final String otp;
  final String otpToken;
  final bool isForgetPassword;
  final String? email;

  VerifyCodeParams({
    required this.otp,
    required this.otpToken,
    required this.isForgetPassword,
    this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      'otp': otp,
      'otp_token': otpToken,
      if (isForgetPassword) 'email': email
    };
  }
}

// ======================= SIGN UP PARAMS ==========================
class SignUpParams {
  final String name;
  final String phone;
  final String password;
  final String confirmPassword;

  SignUpParams({
    required this.name,
    required this.phone,
    required this.password,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'mobile': phone,
      'password': password,
      'password_confirmation': confirmPassword
    };
  }
}

// ======================= CREATE NEW PASSWORD PARAMS ==========================
class CreateNewPasswordParams {
  final String password;
  final String confirmPassword;
  CreateNewPasswordParams({
    required this.password,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() {
    return {'password': password, 'password_confirmation': confirmPassword};
  }
}
