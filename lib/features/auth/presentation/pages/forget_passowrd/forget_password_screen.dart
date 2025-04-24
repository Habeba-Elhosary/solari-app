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
import 'package:solari/core/widgets/app_spacer.dart';
import 'package:solari/features/auth/presentation/cubits/forget_password/forget_password_cubit.dart';
import 'package:solari/features/auth/presentation/pages/verify_otp/verify_otp_screen.dart';
import 'package:solari/injection_container.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider<ForgetPasswordCubit>(
        create: (BuildContext context) => sl<ForgetPasswordCubit>(),
        child: SafeArea(
          child: Padding(
            padding: SizeConfig.paddingSymmetric.copyWith(top: 10.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Image.asset(
                        AppAssets.appLogoBlue,
                        height: 130.sp,
                      ),
                      const AppSpacer(heightRatio: 3),
                      Text(
                        tr('do_you_forgot_password'),
                        style: TextStyles.bold18
                            .copyWith(fontFamily: AppFonts.robotoSlab),
                      ),
                      const AppSpacer(heightRatio: 0.5),
                      Text(
                        tr('forgot_password_description'),
                        style: TextStyles.bold14
                            .copyWith(color: AppColors.greyDark),
                      ),
                      const AppSpacer(heightRatio: 1),
                      Form(
                        key: _formKey,
                        child: TextFormField(
                          onTapOutside: (PointerDownEvent event) {
                            FocusScope.of(context).unfocus();
                          },
                          cursorColor: AppColors.primary,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (String? value) => Validator.email(value),
                          decoration: InputDecoration(
                            labelText: tr('email'),
                          ),
                        ),
                      ),
                      const AppSpacer(heightRatio: 1),
                      BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
                        listener: (context, state) {
                          if (state is ForgetPasswordSuccess) {
                            appNavigator.push(
                              screen: OTPVerficationScreen(
                                isForgetPassword: true,
                                email: emailController.text,
                                otpToken: state.otpToken,
                              ),
                            );
                          }
                        },
                        builder: (context, state) {
                          return ElevatedButton(
                            onPressed: () {
                              if (!_formKey.currentState!.validate()) {
                                return;
                              }
                              context
                                  .read<ForgetPasswordCubit>()
                                  .forgetPasswordEvent(
                                      email: emailController.text);
                            },
                            child: Text(tr('send_code')),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
