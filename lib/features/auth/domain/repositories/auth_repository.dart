import 'package:fpdart/fpdart.dart';
import 'package:solari/core/errors/failures.dart';
import 'package:solari/features/auth/domain/entities/signin_response.dart';
import '../entities/forget_password_reponse.dart';
import '../entities/verification_code_reponse.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> autoSignIn();
  Future<Either<Failure, User>> signIn(SignInParams params);
  Future<Either<Failure, Unit>> signUp(SignUpParams params);
  Future<Either<Failure, Unit>> signOut();
  Future<Either<Failure, Unit>> deleteAccount();

  Future<Either<Failure, ForgetPasswordResponse>> forgetPassword(
      ForgetPasswordParams params);
  Future<Either<Failure, VerificationCodeRepsonse>> sendOTPCode(
      ForgetPasswordParams params);
  Future<Either<Failure, Unit>> verfiyCode(VerifyCodeParams params);
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

// ======================= FORGET PASSWORD PARAMS ==========================
class ForgetPasswordParams {
  final String phone;
  ForgetPasswordParams({required this.phone});

  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
    };
  }
}

// ======================= VERIFY CODE PARAMS ==========================
class VerifyCodeParams {
  final String code;
  VerifyCodeParams({required this.code});

  Map<String, dynamic> toJson() {
    return {
      'code': code,
    };
  }
}
