import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solari/core/constants/app_colors.dart';
import 'package:solari/core/constants/app_fonts.dart';
import 'package:solari/core/constants/app_text_styles.dart';
import 'package:solari/core/constants/size_configuration.dart';
import 'package:solari/core/widgets/loading.dart';
import 'package:solari/injection_container.dart';
import '../../../../../core/widgets/app_spacer.dart';
import '../cubits/signout/signout_cubit.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          tr('are_you_sure'),
          style: TextStyles.regular20.copyWith(fontFamily: AppFonts.robotoSlab),
          textAlign: TextAlign.center,
        ),
        const AppSpacer(
          heightRatio: 1,
        ),
        Row(
          children: <Widget>[
            BlocBuilder<SignOutCubit, SignOutState>(
              builder: (context, state) {
                return Visibility(
                  visible: state is! SignOutLoading,
                  replacement: Expanded(child: Loading()),
                  child: Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.red,
                      ),
                      onPressed: () {
                        context.read<SignOutCubit>().signOutEvent();
                      },
                      child: Text(
                        tr('sign_out'),
                      ),
                    ),
                  ),
                );
              },
            ),
            const AppSpacer(widthRatio: 0.3),
            Expanded(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r)),
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.hPadding,
                    vertical: 16.sp,
                  ),
                ),
                onPressed: () {
                  appNavigator.pop();
                },
                child: Text(
                  tr('cancel'),
                  style: TextStyles.bold16.copyWith(
                    fontFamily: AppFonts.robotoSlab,
                    color: AppColors.black,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
