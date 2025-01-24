import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt sl = GetIt.instance;

abstract class ServiceLocator {
  static Future<void> init() async {
    sl.allowReassignment = true;
    // features

    // core
    _injectSharedPreferences();
  }
}

// void _injectAppLocation() {
//   sl.registerLazySingleton<AppLocation>(() => AppLocationImpl());
// }

void _injectSharedPreferences() async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
}

// void _injectSecureStorage() async {
//   AndroidOptions androidOptions = const AndroidOptions(
//     encryptedSharedPreferences: true,
//   );
//   final FlutterSecureStorage storage =
//       FlutterSecureStorage(aOptions: androidOptions);
//   sl.registerLazySingleton<FlutterSecureStorage>(() => storage);
// }

SharedPreferences get sharedPreferences => sl<SharedPreferences>();
