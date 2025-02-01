import 'package:flutter/material.dart';
import 'package:solari/core/constants/app_text_styles.dart';
import '../../../core/widgets/app_spacer.dart';

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
            AppSpacer(heightRatio: .5),
            // Assets.images.noInternet.svg(),
            Text(
              'LocaleKeys.no_internet_title.tr()',
              textAlign: TextAlign.center,
              style: TextStyles.medium18,
            ),
            AppSpacer(heightRatio: 1.3),
            // AppProgressButton(
            //   text: LocaleKeys.no_internet_subTitle.tr(),
            //   height: 30,
            //   fontSize: 14.sp,
            //   onPressed: (anim) async {
            //     await AppSettings.openAppSettings(type: AppSettingsType.wifi);
            //   },
            // ),
            AppSpacer(heightRatio: .5),
          ],
        ),
      ),
    );
  }
}
