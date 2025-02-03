import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solari/features/auth/presentation/cubits/auto_signin/auto_signin_cubit.dart';
import 'package:solari/features/auth/presentation/cubits/create_new_password/create_new_password_cubit.dart';
import 'package:solari/features/auth/presentation/cubits/forget_password/forget_password_cubit.dart';
import 'package:solari/features/auth/presentation/cubits/send_otp/send_otp_cubit.dart';
import 'package:solari/features/auth/presentation/cubits/signin/signin_cubit.dart';
import 'package:solari/features/auth/presentation/cubits/signout/signout_cubit.dart';
import 'package:solari/features/auth/presentation/cubits/signup/signup_cubit.dart';
import 'package:solari/features/auth/presentation/cubits/verfiy_code/verfiy_code_cubit.dart';
import 'package:solari/injection_container.dart';

List<BlocProvider<Cubit<Object>>> authBlocs() => <BlocProvider<Cubit<Object>>>[
      BlocProvider<AutoSignInCubit>(
        create: (BuildContext context) =>
            sl<AutoSignInCubit>()..autoSignInEvent(),
      ),
      BlocProvider<SignInCubit>(
        create: (BuildContext context) => sl<SignInCubit>(),
      ),
      BlocProvider<SignUpCubit>(
        create: (BuildContext context) => sl<SignUpCubit>(),
      ),
      BlocProvider<SignOutCubit>(
        create: (BuildContext context) => sl<SignOutCubit>(),
      ),
      BlocProvider<ForgetPasswordCubit>(
        create: (BuildContext context) => sl<ForgetPasswordCubit>(),
      ),
      BlocProvider<VerfiyCodeCubit>(
        create: (BuildContext context) => sl<VerfiyCodeCubit>(),
      ),
      BlocProvider<CreateNewPasswordCubit>(
        create: (BuildContext context) => sl<CreateNewPasswordCubit>(),
      ),
      BlocProvider<SendOtpCubit>(
        create: (BuildContext context) => sl<SendOtpCubit>(),
      ),
    ];
