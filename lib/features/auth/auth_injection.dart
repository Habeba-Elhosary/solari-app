import 'package:solari/features/auth/domain/usecases/create_new_password.dart';
import 'package:solari/features/auth/domain/usecases/send_otp_code.dart';
import 'package:solari/features/auth/domain/usecases/signout.dart';
import 'package:solari/features/auth/domain/usecases/verfiy_code.dart';
import 'package:solari/features/auth/presentation/cubits/create_new_password/create_new_password_cubit.dart';
import 'package:solari/features/auth/presentation/cubits/send_otp/send_otp_cubit.dart';
import 'package:solari/features/auth/presentation/cubits/signin/signin_cubit.dart';
import 'package:solari/features/auth/presentation/cubits/signout/signout_cubit.dart';
import 'package:solari/features/auth/presentation/cubits/verfiy_code/verfiy_code_cubit.dart';
import '../../injection_container.dart';
import 'data/datasources/auth_local_datasource.dart';
import 'data/datasources/auth_remote_datasource.dart';
import 'data/repositories/auth_repository_impl.dart';
import 'domain/repositories/auth_repository.dart';
import 'domain/usecases/auto_signin.dart';
import 'domain/usecases/forget_password.dart';
import 'domain/usecases/signin.dart';
import 'presentation/cubits/auto_signin/auto_signin_cubit.dart';
import 'presentation/cubits/forget_password/forget_password_cubit.dart';
//  sl.registerLazySingleton(() => SignUpCubit(signUpUseCase: sl()));

// sl.registerLazySingleton(() => SignUpUseCase(authRepository: sl()));

void initAuthInjection() async {
  //* Cubits
  sl.registerLazySingleton(() => AutoSignInCubit(autoSignInUseCase: sl()));
  sl.registerLazySingleton(() => SignInCubit(signInUseCase: sl()));
  sl.registerFactory(() => ForgetPasswordCubit(forgetPassword: sl()));
  sl.registerLazySingleton(() => SendOtpCubit(sendOTPCodeUseCase: sl()));
  sl.registerLazySingleton(() => VerfiyCodeCubit(verfiyCode: sl()));
  sl.registerLazySingleton(() => SignOutCubit(signOutUseCase: sl()));
  sl.registerLazySingleton(
      () => CreateNewPasswordCubit(createNewPasswordUseCase: sl()));

  //* UseCases
  sl.registerLazySingleton(() => AutoSignInUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => SignInUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => ForgetPasswordUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => SendOTPCodeUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => VerfiyCodeUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => SignOutUseCase(authRepository: sl()));
  sl.registerLazySingleton(
      () => CreateNewPasswordUseCase(authRepository: sl()));

  //* Repositories
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      authLocalDataSource: sl(),
      authRemoteDataSource: sl(),
    ),
  );

  //* Data Sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(apiBaseHelper: sl()));
  sl.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(sharedPreferences: sl()));
}
