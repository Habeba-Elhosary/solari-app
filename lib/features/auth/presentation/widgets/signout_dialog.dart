import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solari/core/constants/app_colors.dart';
import 'package:solari/core/constants/app_text_styles.dart';
import 'package:solari/injection_container.dart';
import '../../../../../core/widgets/app_spacer.dart';
import '../cubit/signout/signout_cubit.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(tr('are_you_sure'),
            style: TextStyles.bold20.copyWith(
              color: AppColors.red,
            )),
        const AppSpacer(
          heightRatio: 1,
        ),
        Text(tr('you_want_to_logout'), style: TextStyles.regular20),
        const AppSpacer(
          heightRatio: 2,
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.red,
                  ),
                  onPressed: () {
                    appNavigator.pop();
                    context.read<SignOutCubit>().signOutEvent();
                  },
                  child: Text(
                    tr('logout'),
                  )),
            ),
            const AppSpacer(),
            Expanded(
              child: OutlinedButton(
                onPressed: () {
                  appNavigator.pop();
                },
                child: Text(tr('cancel')),
              ),
            ),
          ],
        )
      ],
    );
  }
}
