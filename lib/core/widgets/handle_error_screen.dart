import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solari/generated/locale_keys.g.dart';

handleErrorScreen(BuildContext context) {
  return ErrorWidget.builder = ((details) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.sp),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  LocaleKeys.please_try_again.tr(),
                  style: const TextStyle(
                      fontSize: 23, fontWeight: FontWeight.bold),
                ),
                if (kDebugMode) Text(details.stack.toString()),
              ],
            ),
          ),
        ),
      ),
    );
  });
}
