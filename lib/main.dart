import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_notifications_handler/firebase_notifications_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solari/core/utils/app_bloc_observer/bloc_observer.dart';
import 'package:solari/features/profile/presentation/pages/notifications_screen.dart';
import 'package:solari/firebase_options.dart';
import 'package:solari/injection_container.dart';
import 'package:solari/solari_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await EasyLocalization.ensureInitialized();
  await ServiceLocator.init();
  Bloc.observer = MyBlocObserver();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(
    EasyLocalization(
      path: 'assets/translations',
      supportedLocales: const [Locale('en'), Locale('ar')],
      fallbackLocale: const Locale('en'),
      startLocale: const Locale('en'),
      assetLoader: const RootBundleAssetLoader(),
      child: FirebaseNotificationsHandler(
        onTap: (details) {
          appNavigator.push(screen: NotificationsScreen());
        },
        localNotificationsConfiguration: LocalNotificationsConfiguration(
          androidConfig: AndroidNotificationsConfig(
            appIconGetter: (p0) => '@mipmap/launcher_icon',
          ),
        ),
        child: const MyApp(),
      ),
    ),
  );
}
