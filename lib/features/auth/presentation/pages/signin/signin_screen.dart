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
import 'package:solari/features/auth/presentation/cubits/signin/signin_cubit.dart';
import 'package:solari/features/auth/presentation/pages/forget_passowrd/forget_password_screen.dart';
import 'package:solari/injection_container.dart';
import '../../../../../core/widgets/app_spacer.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> isFormValid = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    emailController.addListener(validateForm);
    passwordController.addListener(validateForm);
  }

  void validateForm() {
    final bool isEmailValid = Validator.email(emailController.text) == null;
    final bool isPasswordValid =
        Validator.password(passwordController.text) == null;

    isFormValid.value = isEmailValid && isPasswordValid;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    isFormValid.dispose();
    super.dispose();
  }

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
                        Image.asset(
                          AppAssets.appLogoBlue,
                          height: 130.sp,
                        ),
                        const AppSpacer(heightRatio: 3),
                        Text(
                          tr('welcome_back'),
                          style: TextStyles.bold18
                              .copyWith(fontFamily: AppFonts.robotoSlab),
                        ),
                        const AppSpacer(heightRatio: 0.5),
                        Text(
                          tr('enter_your_credentials_to_access_your_personalized_space'),
                          style: TextStyles.bold14
                              .copyWith(fontFamily: AppFonts.robotoSlab),
                        ),
                        const AppSpacer(heightRatio: 1.5),
                        TextFormField(
                          controller: emailController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (String? value) => Validator.email(value),
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: AppColors.primary,
                          decoration: InputDecoration(
                            labelText: tr('email'),
                          ),
                          onTapOutside: (PointerDownEvent event) {
                            FocusScope.of(context).unfocus();
                          },
                        ),
                        const AppSpacer(heightRatio: 0.5),
                        PasswordTextFormField(
                          labelText: tr('password'),
                          controller: passwordController,
                          validator: (String? value) =>
                              Validator.password(value),
                        ),
                        AppSpacer(heightRatio: 0.7),
                        GestureDetector(
                          onTap: () => appNavigator.push(
                            screen: const ForgetPasswordScreen(),
                          ),
                          child: Text(
                            tr('forgot_password'),
                            textAlign: TextAlign.end,
                            style: TextStyles.regular14,
                          ),
                        ),
                        const AppSpacer(heightRatio: 1.5),
                        BlocBuilder<SignInCubit, SignInState>(
                          builder:
                              (BuildContext context, SignInState signInState) {
                            return Visibility(
                              visible: signInState is! SignInLoading,
                              replacement: const Center(
                                child: CircularProgressIndicator.adaptive(),
                              ),
                              child: ValueListenableBuilder<bool>(
                                valueListenable: isFormValid,
                                builder: (context, isValid, child) {
                                  return ElevatedButton(
                                    onPressed: isValid
                                        ? () {
                                            context
                                                .read<SignInCubit>()
                                                .signInEvent(
                                                  email: emailController.text,
                                                  password:
                                                      passwordController.text,
                                                );
                                          }
                                        : null,
                                    child: Text(tr('sign_in')),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                        const AppSpacer(),
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
