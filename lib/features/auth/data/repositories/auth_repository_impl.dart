import 'package:easy_localization/easy_localization.dart';
import 'package:fpdart/fpdart.dart';
import 'package:solari/core/errors/exceptions.dart';
import 'package:solari/core/errors/failures.dart';
import 'package:solari/features/auth/data/models/forget_password_response.dart';
import 'package:solari/features/auth/data/models/signin_response.dart';
import 'package:solari/features/auth/data/models/verify_otp_response.dart';
// import 'package:solari/features/auth/domain/entities/signin_response.dart';
// import '../../domain/entities/forget_password_reponse.dart';
// import '../../domain/entities/verification_code_reponse.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_datasource.dart';
import '../datasources/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;
  AuthRepositoryImpl(
      {required this.authRemoteDataSource, required this.authLocalDataSource});

  @override
  Future<Either<Failure, SignInResponse>> signIn(SignInParams params) async {
    try {
      final SignInResponse user = await authRemoteDataSource.signIn(params);
      await authLocalDataSource.cacheUserAccessToken(
          token: user.data?.token ?? '');
      await authLocalDataSource.cacheUserCredentials(
        phone: params.email,
        password: params.password,
      );
      return right(user);
    } on ServerException catch (error) {
      return left(ServerFailure.formServerException(error));
    }
  }

  @override
  Future<Either<Failure, SignInResponse>> autoSignIn() async {
    try {
      final (String phone, String password) =
          await authLocalDataSource.getCacheUserCredentials();
      final SignInResponse signInResponse = await authRemoteDataSource.signIn(
        SignInParams(email: phone, password: password),
      );
      return right(signInResponse);
    } on ServerException catch (error) {
      return left(ServerFailure.formServerException(error));
    } on CacheException catch (_) {
      return left(CacheFailure(message: tr('not_authenticated')));
    }
  }

  @override
  Future<Either<Failure, VerifyOtpResponse>> verifyCode(
      VerifyCodeParams params) async {
    try {
      return right(await authRemoteDataSource.verfiyCode(params));
    } on ServerException catch (error) {
      return left(ServerFailure.formServerException(error));
    }
  }

  @override
  Future<Either<Failure, Unit>> signUp(SignUpParams params) async {
    try {
      final String token = await authRemoteDataSource.signUp(params);
      await authLocalDataSource.cacheUserAccessToken(token: token);
      return right(unit);
    } on ServerException catch (error) {
      return left(ServerFailure.formServerException(error));
    }
  }

  @override
  Future<Either<Failure, Unit>> signOut() async {
    try {
      await authRemoteDataSource.signOut();
      await authLocalDataSource.clearData();
      return right(unit);
    } on ServerException catch (error) {
      return left(ServerFailure(message: error.message));
    } on CacheException {
      return left(CacheFailure(message: tr('cache_failure')));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteAccount() async {
    try {
      await authRemoteDataSource.deleteAccount();
      await authLocalDataSource.clearData();
      return right(unit);
    } on ServerException catch (error) {
      return left(ServerFailure(message: tr(error.message)));
    } on CacheException {
      return left(CacheFailure(message: tr('cache_failure')));
    }
  }

  @override
  Future<Either<Failure, Unit>> createNewPassword(
      CreateNewPasswordParams params) async {
    try {
      return right(await authRemoteDataSource.createNewPassword(params));
    } on ServerException catch (error) {
      return left(ServerFailure.formServerException(error));
    }
  }

  @override
  Future<Either<Failure, ForgetPasswordResponse>> forgetPassword(
      ForgetPasswordParams params) async {
    try {
      final ForgetPasswordResponse data =
          await authRemoteDataSource.forgetPassword(params);
      return right(data);
    } on ServerException catch (error) {
      return left(ServerFailure.formServerException(error));
    }
  }

  @override
  Future<Either<Failure, ForgetPasswordResponse>> sendOTPCode() async {
    try {
      return right(await authRemoteDataSource.sendOTPCode());
    } on ServerException catch (error) {
      return left(ServerFailure.formServerException(error));
    }
  }
}
