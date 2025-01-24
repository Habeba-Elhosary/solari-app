import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:solari/features/check_internet/cubit/check_internet_cubit.dart';
import 'package:solari/features/check_internet/cubit/check_internet_state.dart';
import 'package:solari/features/check_internet/pages/no_internet_dialog.dart';
import 'core/constant/styles/material_app_theme.dart';
import 'core/util/font_scale_handler.dart';
import 'core/util/router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final botToastBuilder = BotToastInit();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => InternetConnectionCubit(),
        ),
      ],
      child: BlocConsumer<InternetConnectionCubit, InternetConnectionState>(
        listener: (context, state) {
          if (state is InternetGainedState) {
            Future.delayed(
              Duration(seconds: 3),
              () {
                if (MagicRouter.canPop()) {
                  MagicRouter.pop();
                }
              },
            );
          }
          if (state is InternetLostState) {
            Future.delayed(
              Duration(),
              () {
                MagicRouter.showDialog(
                  isDismissible: false,
                  child: NoInternetDialog(),
                );
              },
            );
          }
        },
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(430, 971),
            minTextAdapt: true,
            fontSizeResolver: (num fontSize, ScreenUtil instance) {
              return FontScaleHandler.calculateFontSize(fontSize.toDouble());
            },
            splitScreenMode: true,
            builder: (BuildContext context, Widget? child) {
              return MaterialApp(
                navigatorObservers: [
                  BotToastNavigatorObserver(),
                  SentryNavigatorObserver(),
                ],
                debugShowCheckedModeBanner: false,
                // onGenerateTitle: (context) => LocaleKeys.app_name.tr(),
                theme: MaterialAppTheme.appTheme,
                locale: context.locale,
                supportedLocales: context.supportedLocales,
                localizationsDelegates: [
                  ...context.localizationDelegates,
                ],
                navigatorKey: navigatorKey,
                onGenerateRoute: onGenerateRoute,
                home: const Text('test'),
                builder: (context, child) {
                  // handelErrorScreen(context);
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
