import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solari/core/constants/app_text_styles.dart';
import 'package:solari/core/constants/size_configuration.dart';
import 'package:solari/core/utils/app_validator/app_validator.dart';
import 'package:solari/core/widgets/app_spacer.dart';
import 'package:solari/core/widgets/password_text_form_field.dart';
import 'package:solari/features/auth/presentation/cubits/signup/signup_cubit.dart';

class RequestRegisterScreen extends StatefulWidget {
  const RequestRegisterScreen({super.key});

  @override
  State<RequestRegisterScreen> createState() => _RequestRegisterScreenState();
}

class _RequestRegisterScreenState extends State<RequestRegisterScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool isAcceptTerms = false;
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: SizeConfig.paddingSymmetric.copyWith(bottom: 0, top: 0),
        child: const SafeArea(top: false, child: RegiserForm()),
      ),
    );
  }
}

class RegiserForm extends StatefulWidget {
  const RegiserForm({super.key});

  @override
  State<RegiserForm> createState() => _RegiserFormState();
}

class _RegiserFormState extends State<RegiserForm> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool isAcceptTerms = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    tr('new_client'),
                    style: TextStyles.bold20,
                  ),
                  const AppSpacer(
                    heightRatio: 0.25,
                  ),
                  Text(
                    tr('request_register_hint'),
                    style: TextStyles.light16,
                  ),
                  const AppSpacer(
                    heightRatio: 0.5,
                  ),
                  Text(
                    tr('name'),
                    style: TextStyles.regular16,
                  ),
                  const AppSpacer(
                    heightRatio: .25,
                  ),
                  TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.text,
                      onChanged: (String value) {},
                      validator: (String? value) =>
                          Validator.defaultValidator(value),
                      onTapOutside: (PointerDownEvent event) {
                        FocusScope.of(context).unfocus();
                      },
                      decoration: InputDecoration(
                        hintText: tr('enter_your_name'),
                      )),
                  const AppSpacer(
                    heightRatio: 0.5,
                  ),
                  Text(
                    tr('phone'),
                    style: TextStyles.regular16,
                  ),
                  const AppSpacer(
                    heightRatio: .25,
                  ),
                  TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      onChanged: (String value) {},
                      validator: (String? value) => Validator.phone(value),
                      onTapOutside: (PointerDownEvent event) {
                        FocusScope.of(context).unfocus();
                      },
                      decoration: InputDecoration(
                        hintText: tr('enter_your_phone'),
                      )),
                  const AppSpacer(
                    heightRatio: 0.5,
                  ),
                  PasswordTextFormField(
                    controller: passwordController,
                  ),
                  const AppSpacer(
                    heightRatio: 0.5,
                  ),
                  PasswordTextFormField(
                    controller: confirmPasswordController,
                    labelText: tr('confirm_password'),
                    validator: (String? value) => Validator.confirmPassword(
                        value, passwordController.text),
                  ),
                  const AppSpacer(
                    heightRatio: 0.5,
                  ),
                  const AppSpacer(),
                ],
              ),
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Checkbox.adaptive(
                value: isAcceptTerms,
                onChanged: (bool? value) {
                  setState(() {
                    isAcceptTerms = value!;
                  });
                }),
            Expanded(
              child: InkWell(
                onTap: () {},
                child: Text.rich(TextSpan(
                    style: TextStyles.regular14,
                    children: <InlineSpan>[
                      TextSpan(text: tr('accept_on')),
                      const TextSpan(text: ' '),
                      TextSpan(
                          text: tr('terms_and_conditions'),
                          style: TextStyles.regular14
                              .copyWith(decoration: TextDecoration.underline)),
                      const TextSpan(text: ' '),
                      TextSpan(text: tr('and')),
                      TextSpan(
                          text: tr('privacy'),
                          style: TextStyles.regular14
                              .copyWith(decoration: TextDecoration.underline)),
                      const TextSpan(text: ' '),
                      TextSpan(text: tr('blong_to_us')),
                    ])),
              ),
            )
          ],
        ),
        BlocBuilder<SignUpCubit, SignUpState>(
          builder: (BuildContext context, SignUpState state) {
            return Visibility(
                visible: state is! SignUpLoading,
                replacement:
                    const Center(child: CircularProgressIndicator.adaptive()),
                child: ElevatedButton(
                  onPressed: isAcceptTerms
                      ? () {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          }

                          context.read<SignUpCubit>().signUpEvent(
                              phone: phoneController.text,
                              name: nameController.text,
                              confirmPassword: confirmPasswordController.text,
                              password: passwordController.text);
                        }
                      : null,
                  child: Text(
                    tr('send_request'),
                  ),
                ));
          },
        ),
        const AppSpacer(
          heightRatio: .25,
        ),
      ],
    );
  }
}
