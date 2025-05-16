import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solari/core/constants/app_assets.dart';
import 'package:solari/core/constants/app_colors.dart';
import 'package:solari/core/constants/app_fonts.dart';
import 'package:solari/core/constants/app_text_styles.dart';
import 'package:solari/core/constants/size_configuration.dart';
import 'package:solari/core/utils/app_validator/app_validator.dart';
import 'package:solari/core/widgets/password_text_form_field.dart';
import '../../../../../core/widgets/app_spacer.dart';
import '../../cubits/create_new_password/create_new_password_cubit.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  final String resetToken;
  const CreateNewPasswordScreen({super.key, required this.resetToken});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: SizeConfig.paddingSymmetric,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Image.asset(
                    AppAssets.appLogoBlue,
                    height: 130.sp,
                  ),
                  const AppSpacer(heightRatio: 3),
                  Text(
                    tr('create_new_password'),
                    style: TextStyles.bold18
                        .copyWith(fontFamily: AppFonts.robotoSlab),
                  ),
                  const AppSpacer(heightRatio: 0.5),
                  Text(
                    tr('create_new_password_description'),
                    style:
                        TextStyles.bold14.copyWith(color: AppColors.greyDark),
                  ),
                  const AppSpacer(heightRatio: 1),
                  PasswordTextFormField(
                    labelText: tr('password'),
                    validator: (String? value) => Validator.password(value),
                    controller: passwordController,
                  ),
                  const AppSpacer(),
                  PasswordTextFormField(
                    labelText: tr('confirm_password'),
                    validator: (String? value) => Validator.confirmPassword(
                        value, passwordController.text),
                    controller: confirmPasswordController,
                  ),
                  const AppSpacer(heightRatio: 1),
                  ElevatedButton(
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }
                      context
                          .read<CreateNewPasswordCubit>()
                          .createNewPasswordEvent(
                              password: passwordController.text,
                              resetToken: widget.resetToken);
                    },
                    child: Text(tr('confirm')),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
