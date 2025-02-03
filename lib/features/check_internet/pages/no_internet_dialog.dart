import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solari/core/constants/app_assets.dart';
import 'package:solari/core/constants/app_text_styles.dart';
import '../../../core/widgets/app_spacer.dart';
import 'package:app_settings/app_settings.dart';

class NoInternetDialog extends StatelessWidget {
  const NoInternetDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppSpacer(heightRatio: 0.5),
            Image.asset(AppAssets.noInternet, height: 100.sp),
            Text(
              tr('no_internet_title'),
              textAlign: TextAlign.center,
              style: TextStyles.semiBold16,
            ),
            AppSpacer(heightRatio: 1),
            ElevatedButton(
              onPressed: () async {
                await AppSettings.openAppSettings(type: AppSettingsType.wifi);
              },
              child: Text(
                tr('no_internet_subTitle'),
                style: TextStyles.semiBold16,
              ),
            ),
            AppSpacer(heightRatio: 0.5),
          ],
        ),
      ),
    );
  }
}
