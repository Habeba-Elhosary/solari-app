import 'package:flutter/material.dart';
import 'package:solari/my_app.dart';
import '../../widgets/app_dialogs.dart';

class AppNavigator {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> webNavigatorKey = GlobalKey<NavigatorState>();
  Future<void> push({required Widget screen}) async {
    if (webNavigatorKey.currentContext != null) {
      await webNavigatorKey.currentState!
          .push(MaterialPageRoute(builder: (BuildContext context) => screen));
      return;
    }
    await navigatorKey.currentState!
        .push(MaterialPageRoute(builder: (BuildContext context) => screen));
  }

  Future<void> pushReplacement({required Widget screen}) async {
    if (webNavigatorKey.currentContext != null) {
      await webNavigatorKey.currentState!.pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => screen));
      return;
    }
    await navigatorKey.currentState!.pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => screen));
  }

  dynamic pop({dynamic object}) {
    if (webNavigatorKey.currentState?.canPop() ?? false) {
      webNavigatorKey.currentState?.pop<dynamic>(object);
    }
    if (navigatorKey.currentState?.canPop() ?? false) {
      navigatorKey.currentState?.pop<dynamic>(object);
    }
  }

  dynamic popUtill({required Widget screen}) {
    if (webNavigatorKey.currentContext != null) {
      webNavigatorKey.currentState!.pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext c) => screen),
          (Route route) => false);
      return;
    }
    return navigatorKey.currentState!.pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext c) => screen),
        (Route route) => false);
  }

  dynamic popToFirst({dynamic object}) {
    if (webNavigatorKey.currentContext != null) {
      webNavigatorKey.currentState!.popUntil((Route rout) => rout.isFirst);
      return;
    }
    return navigatorKey.currentState!.popUntil((Route rout) => rout.isFirst);
  }

  Future<void> showDialog({
    required Widget child,
  }) {
    if (webNavigatorKey.currentContext != null) {
      return AppDialogs.showAppDialog(webNavigatorKey.currentContext!, child);
    }
    return AppDialogs.showAppDialog(navigatorKey.currentContext!, child);
  }

  dynamic showSheet({
    required Widget child,
  }) {
    if (webNavigatorKey.currentContext != null) {
      return AppDialogs.showAppSheet(webNavigatorKey.currentContext!, child);
    }
    return AppDialogs.showAppSheet(navigatorKey.currentContext!, child);
  }

  dynamic popToRawy({dynamic object}) {
    return navigatorKey.currentState!.pushAndRemoveUntil(
      MaterialPageRoute(builder: (BuildContext context) => const MyApp()),
      (Route<dynamic> route) => false,
    );
  }

  bool canPop() {
    return navigatorKey.currentState?.canPop() ?? false;
  }
}
