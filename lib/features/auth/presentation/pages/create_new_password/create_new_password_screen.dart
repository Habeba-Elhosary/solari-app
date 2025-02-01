import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solari/core/constants/app_text_styles.dart';
import 'package:solari/core/constants/size_configuration.dart';
import 'package:solari/core/utils/app_validator/app_validator.dart';
import 'package:solari/core/widgets/password_text_form_field.dart';
import '../../../../../core/widgets/app_spacer.dart';
import '../../cubit/create_new_password/create_new_password_cubit.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({
    super.key,
  });

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
      body: SingleChildScrollView(
        child: Padding(
          padding: SizeConfig.paddingSymmetric,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  tr('create_new_password'),
                  style: TextStyles.bold20,
                ),
                Text(
                  tr('enter_your_data'),
                  style: TextStyles.light16,
                ),
                const AppSpacer(
                  heightRatio: 0.5,
                ),
                PasswordTextFormField(
                    hintText: tr('new_password'),
                    validator: (String? value) => Validator.password(
                          value,
                        ),
                    controller: passwordController),
                const AppSpacer(),
                PasswordTextFormField(
                    hintText: tr('confirm_new_password'),
                    validator: (String? value) => Validator.confirmPassword(
                        value, passwordController.text),
                    controller: confirmPasswordController),
                const AppSpacer(
                  heightRatio: 1,
                ),
                TextButton(
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }
                    context
                        .read<CreateNewPasswordCubit>()
                        .createNewPasswordEvent(
                            password: passwordController.text,
                            confirmPassword: confirmPasswordController.text);
                  },
                  child: Text(tr('confirm')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
