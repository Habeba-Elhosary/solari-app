import 'package:flutter/material.dart';
import '../widgets/app_dialogs.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Route<dynamic>? onGenerateRoute(RouteSettings settings) => null;

class MagicRouter {
  static BuildContext? currentContext = navigatorKey.currentContext;

  static Future<dynamic> navigateTo(Widget page) =>
      navigatorKey.currentState!.push(_materialPageRoute(page));
  static Future<dynamic> navigateAndReplace(Widget page) =>
      navigatorKey.currentState!.pushReplacement(_materialPageRoute(page));

  static Future<dynamic> navigateAndPopAll(Widget page) =>
      navigatorKey.currentState!.pushAndRemoveUntil(
        _materialPageRoute(page),
        (_) => false,
      );

  static Future<dynamic> navigateAndPopUntilFirstPage(Widget page) =>
      navigatorKey.currentState!.pushAndRemoveUntil(
          _materialPageRoute(page), (route) => route.isFirst);

  static void pop([Object? object]) => navigatorKey.currentState!.pop(object);

  static Route<dynamic> _materialPageRoute(Widget page) =>
      MaterialPageRoute(builder: (_) => page);

  static dynamic showDialog({
    required Widget child,
    bool? isDismissible,
  }) {
    return AppDialogs.showAppDialog(
      navigatorKey.currentContext!,
      child,
      isDismissible: isDismissible,
    );
  }

  static dynamic showSheet({
    required Widget child,
  }) {
    return AppDialogs.showAppSheet(navigatorKey.currentContext!, child);
  }

  // New canPop method to check if we can pop the navigation stack
  static bool canPop() {
    return navigatorKey.currentState?.canPop() ?? false;
  }
}
