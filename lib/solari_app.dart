import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solari/core/constants/theme/app_material_theme.dart';
import 'package:solari/core/utils/app_navigation/app_navigator.dart';
import 'package:solari/core/widgets/handle_error_screen.dart';
import 'package:solari/features/analytics/presentation/cubits/analytics_cubit.dart';
import 'package:solari/features/auth/auth_cubits.dart';
import 'package:solari/features/auth/presentation/cubits/auto_signin/auto_signin_cubit.dart';
import 'package:solari/features/auth/presentation/pages/onboarding/onboarding_screen.dart';
import 'package:solari/features/auth/presentation/pages/signin/signin_screen.dart';
import 'package:solari/features/auth/presentation/pages/splash/splash_screen.dart';
import 'package:solari/features/check_internet/cubit/check_internet_cubit.dart';
import 'package:solari/features/check_internet/cubit/check_internet_state.dart';
import 'package:solari/features/check_internet/pages/no_internet_dialog.dart';
import 'package:solari/features/general/presentation/cubits/all_systems/all_systems_cubit.dart';
import 'package:solari/features/general/presentation/cubits/all_technicians/all_technicians_cubit.dart';
import 'package:solari/features/home/presentation/cubitS/nav_bar/nav_bar_cubit.dart';
import 'package:solari/features/home/presentation/cubits/system_home/system_home_cubit.dart';
import 'package:solari/features/home/presentation/pages/main_screen.dart';
import 'package:solari/features/panels/presentation/cubits/all_panels/all_panels_cubit.dart';
import 'package:solari/injection_container.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.detached:
        break;

      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.hidden:
        break;
      case AppLifecycleState.paused:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final botToastBuilder = BotToastInit();
    return MultiBlocProvider(
      providers: [
        ...authBlocs(),
        BlocProvider(create: (context) => InternetConnectionCubit()),
        BlocProvider<NavBarCubit>(
          create: (BuildContext context) => sl<NavBarCubit>(),
        ),
        BlocProvider<SystemHomeCubit>(
          create: (BuildContext context) => sl<SystemHomeCubit>(),
        ),
        BlocProvider<AllPanelsCubit>(
          create: (BuildContext context) => sl<AllPanelsCubit>(),
        ),
        BlocProvider<AllSystemsCubit>(
          create: (BuildContext context) => sl<AllSystemsCubit>(),
        ),
        BlocProvider<AllTechniciansCubit>(
          create: (BuildContext context) => sl<AllTechniciansCubit>(),
        ),
        BlocProvider<AnalyticsCubit>(
          create: (context) => sl<AnalyticsCubit>()..getAllAnalyticsEvent(),
        ),
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
              Duration(seconds: 3),
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
                home: SolariApp(),
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

class SolariApp extends StatelessWidget {
  const SolariApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AutoSignInCubit, AutoSignInState>(
      builder: (context, state) {
        if (state is AutoSignInHasUser) {
          return const MainScreen();
        }
        if (state is AutoSignInNoUser) {
          return const OnboardingScreen();
        }
        if (state is AutoSignInSeenIntro) {
          return const SignInScreen();
        }
        return const SplashScreen();
      },
    );
  }
}
