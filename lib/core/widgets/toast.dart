import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Timer? _toastDebounce;

Future<void> showToast({required String message, Color? bg}) async {
  if (_toastDebounce?.isActive ?? false) {
    _toastDebounce!.cancel();
  }

  _toastDebounce = Timer(Duration(milliseconds: 100), () {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      gravity: ToastGravity.TOP,
      backgroundColor: bg ?? Colors.black,
      textColor: Colors.white,
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 2,
    );
  });
}

showErrorToast(String? message) {
  if (message != null) {
    showToast(message: message, bg: Colors.red);
  }
}

showSuccessToast(String? message) {
  if (message != null) {
    showToast(message: message, bg: Colors.green);
  }
}

void showErrors(List<String>? errors, [int index = 0]) {
  if (errors == null) return;
  if (errors.isEmpty) return;
  if (index >= (errors.length)) return;
  Fluttertoast.showToast(
    msg: errors[index],
    gravity: ToastGravity.TOP,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0,
    toastLength: Toast.LENGTH_SHORT,
    timeInSecForIosWeb: 1,
  ).then(
    (value) {
      Future.delayed(
        Duration(seconds: 2),
        () {
          showErrors(errors, index + 1);
        },
      );
    },
  );
}
