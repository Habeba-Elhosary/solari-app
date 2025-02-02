import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solari/core/constants/theme/app_material_theme.dart';
import 'package:solari/core/utils/app_navigation/app_navigator.dart';
import 'package:solari/core/widgets/handle_error_screen.dart';
import 'package:solari/features/auth/auth_cubits.dart';
import 'package:solari/features/auth/presentation/cubits/auto_signin/auto_signin_cubit.dart';
import 'package:solari/features/auth/presentation/pages/onboarding/onboarding_screen.dart';
import 'package:solari/features/auth/presentation/pages/signin/signin_screen.dart';
import 'package:solari/features/auth/presentation/pages/splash/splash_screen.dart';
import 'package:solari/features/check_internet/cubit/check_internet_cubit.dart';
import 'package:solari/features/check_internet/cubit/check_internet_state.dart';
import 'package:solari/features/check_internet/pages/no_internet_dialog.dart';
import 'package:solari/injection_container.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final botToastBuilder = BotToastInit();
    return MultiBlocProvider(
      providers: [
        ...authBlocs(),
        BlocProvider(create: (context) => InternetConnectionCubit()),
      ],
      child: BlocConsumer<InternetConnectionCubit, InternetConnectionState>(
        listener: (context, state) {
          if (state is InternetGainedState) {
            Future.delayed(
              Duration(seconds: 3),
              () {
                if (appNavigator.canPop()) {
                  appNavigator.pop();
                }
              },
            );
          }
          if (state is InternetLostState) {
            Future.delayed(
              Duration(),
              () {
                appNavigator.showDialog(child: NoInternetDialog());
              },
            );
          }
        },
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(430, 971),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (BuildContext context, Widget? child) {
              return MaterialApp(
                navigatorObservers: [
                  BotToastNavigatorObserver(),
                ],
                debugShowCheckedModeBanner: false,
                theme: AppMaterialTheme.lightTheme,
                onGenerateTitle: (context) => tr('app_name'),
                locale: context.locale,
                supportedLocales: context.supportedLocales,
                localizationsDelegates: [
                  ...context.localizationDelegates,
                ],
                navigatorKey: sl<AppNavigator>().navigatorKey,
                home: BlocBuilder<AutoSignInCubit, AutoSignInState>(
                  builder: (context, state) {
                    if (state is AutoSignInHasUser) {
                      return const HomeScreen();
                    }
                    if (state is AutoSignInNoUser) {
                      return const OnboardingScreen();
                    }
                    if (state is AutoSignInError) {
                      return const OnboardingScreen();
                    }
                    if (state is AutoSignInSeenIntro) {
                      return const SignInScreen();
                    }
                    return const SplashScreen();
                  },
                ),
                builder: (context, child) {
                  handleErrorScreen(context);
                  child = botToastBuilder(context, child!);
                  return child;
                },
              );
            },
          );
        },
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {},
          child: const Text('name'),
        ),
      ),
    );
  }
}
