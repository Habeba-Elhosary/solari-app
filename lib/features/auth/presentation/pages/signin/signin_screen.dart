import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solari/core/constants/app_text_styles.dart';
import 'package:solari/core/constants/size_configuration.dart';
import 'package:solari/core/utils/app_validator/app_validator.dart';
import 'package:solari/core/widgets/password_text_form_field.dart';
import 'package:solari/features/auth/presentation/cubit/signin/signin_cubit.dart';
import 'package:solari/features/auth/presentation/pages/forget_passowrd/forget_password_screen.dart';
import 'package:solari/features/auth/presentation/pages/signup/signup_screen.dart';
import 'package:solari/injection_container.dart';
import '../../../../../core/widgets/app_spacer.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: SizeConfig.paddingSymmetric,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: Text(tr('sign_in'), style: TextStyles.bold24),
                        ),
                        const AppSpacer(heightRatio: 1),
                        Text(tr('phone'), style: TextStyles.regular16),
                        TextFormField(
                          controller: phoneController,
                          validator: (String? value) => Validator.phone(value),
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(hintText: tr('phone')),
                          onTapOutside: (PointerDownEvent event) {
                            FocusScope.of(context).unfocus();
                          },
                        ),
                        const AppSpacer(heightRatio: 1.5),
                        PasswordTextFormField(
                          controller: passwordController,
                          validator: (String? value) =>
                              Validator.defaultValidator(value),
                        ),
                        const AppSpacer(heightRatio: 1.5),
                        InkWell(
                          onTap: () => appNavigator.push(
                              screen: const ForgetPasswordScreen()),
                          child: Text(
                            tr('did_you_forget_password'),
                            textAlign: TextAlign.end,
                            style: TextStyles.light14,
                          ),
                        ),
                        const AppSpacer(),
                        BlocBuilder<SignInCubit, SignInState>(
                          builder:
                              (BuildContext context, SignInState signInState) {
                            return Visibility(
                              visible: signInState is! SignInLoading,
                              replacement: const Center(
                                child: CircularProgressIndicator.adaptive(),
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  if (!_formKey.currentState!.validate()) {
                                    return;
                                  }
                                  context.read<SignInCubit>().signInEvent(
                                        phone: phoneController.text,
                                        password: passwordController.text,
                                      );
                                },
                                child: Text(tr('sign_in')),
                              ),
                            );
                          },
                        ),
                        const AppSpacer(),
                        InkWell(
                          onTap: () => appNavigator.push(
                              screen: const RequestRegisterScreen()),
                          child: Text.rich(
                            TextSpan(
                              style: TextStyles.regular16,
                              children: <InlineSpan>[
                                TextSpan(
                                  text: "${tr('dont_have_account')} ",
                                ),
                                TextSpan(
                                    text: tr('sign_up'),
                                    style: TextStyles.regular16)
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
