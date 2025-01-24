// import 'package:flutter/material.dart';
// import 'package:madmoun/my_app.dart';
// import '../widgets/app_dialogs.dart';

// class AppNavigator {
//   final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
//   Future<void> push({
//     required Widget screen,
//     bool fullscreenDialog = false,
//   }) async {
//     await navigatorKey.currentState!.push(
//       MaterialPageRoute(
//         fullscreenDialog: fullscreenDialog,
//         builder: (BuildContext context) => screen,
//       ),
//     );
//   }

//   Future<void> pushReplacement({required Widget screen}) async {
//     await navigatorKey.currentState!.pushReplacement(
//         MaterialPageRoute(builder: (BuildContext context) => screen));
//   }

//   dynamic pop({dynamic object}) {
//     return navigatorKey.currentState!.pop<dynamic>(object);
//   }

//   dynamic popUtill({required Widget screen}) {
//     return navigatorKey.currentState!.pushAndRemoveUntil(
//       MaterialPageRoute(builder: (BuildContext c) => screen),
//       (Route route) => false,
//     );
//   }

//   dynamic popToFrist({dynamic object}) {
//     if (navigatorKey.currentState!.canPop()) {
//       return;
//     }
//     return navigatorKey.currentState!.popUntil((Route rout) => rout.isFirst);
//   }

//   dynamic showDialog({
//     required Widget child,
//   }) {
//     return AppDialogs.showAppDialog(navigatorKey.currentContext!, child);
//   }

//   dynamic showSheet({
//     required Widget child,
//   }) {
//     return AppDialogs.showAppSheet(navigatorKey.currentContext!, child);
//   }

//   dynamic popToRawy({dynamic object}) {
//     return navigatorKey.currentState!.pushAndRemoveUntil(
//       MaterialPageRoute(builder: (BuildContext context) => const MyApp()),
//       (Route<dynamic> route) => false,
//     );
//   }
// }
