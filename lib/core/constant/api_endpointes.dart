import '../flavors/flavors_config.dart';

class ApiEndpoints {
  static String baseUrl = FlavorConfig.instance.variables['baseUrl'];
  static const String detectUserByPhone = "auth/detect-user-by-phone";
  static const String auth = "auth/";
  static const String login = "${auth}login";
}
