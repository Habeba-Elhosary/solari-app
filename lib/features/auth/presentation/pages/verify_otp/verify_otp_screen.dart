// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solari/core/constants/app_assets.dart';
import 'package:solari/core/constants/app_colors.dart';
import 'package:solari/core/constants/app_fonts.dart';
import 'package:solari/core/constants/app_text_styles.dart';
import 'package:solari/core/constants/size_configuration.dart';
import 'package:solari/core/widgets/app_spacer.dart';
import 'package:solari/features/auth/presentation/cubits/forget_password/forget_password_cubit.dart';
import 'package:solari/features/auth/presentation/cubits/send_otp/send_otp_cubit.dart';
import 'package:solari/features/auth/presentation/cubits/verfiy_code/verfiy_code_cubit.dart';
import 'package:solari/injection_container.dart';
import '../../cubits/verfiy_code/timer_verfiy_code.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPVerficationScreen extends StatefulWidget {
  final bool isForgetPassword;
  final String? email;
  String otpToken;

  OTPVerficationScreen({
    super.key,
    required this.isForgetPassword,
    this.email,
    required this.otpToken,
  });

  @override
  State<OTPVerficationScreen> createState() => _OTPVerficationScreenState();
}

class _OTPVerficationScreenState extends State<OTPVerficationScreen> {
  final TextEditingController otpController = TextEditingController();

  @override
  void initState() {
    super.initState();
    VerificatonCodeTimerStream.counterValue = 60;
    VerificatonCodeTimerStream.autoDecrement();
    VerificatonCodeTimerStream.listen();
  }

  @override
  void dispose() {
    otpController.dispose();
    VerificatonCodeTimerStream.stopTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider<ForgetPasswordCubit>(
        create: (BuildContext context) => sl<ForgetPasswordCubit>(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
                padding: SizeConfig.paddingSymmetric.copyWith(top: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Image.asset(
                      AppAssets.appLogoBlue,
                      height: 130.sp,
                    ),
                    const AppSpacer(heightRatio: 3),
                    Text(
                      tr('verify_otp'),
                      style: TextStyles.bold18
                          .copyWith(fontFamily: AppFonts.robotoSlab),
                    ),
                    const AppSpacer(heightRatio: 0.5),
                    Text(
                      tr('please_enter_the_code_sent_to_your_email'),
                      style: TextStyles.bold14.copyWith(
                          fontFamily: AppFonts.robotoSlab,
                          color: AppColors.greyDark),
                    ),
                    const AppSpacer(heightRatio: 1),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.sp),
                      child: PinCodeTextField(
                        controller: otpController,
                        appContext: context,
                        backgroundColor: Colors.transparent,
                        length: 4,
                        autoDisposeControllers: false,
                        cursorColor: AppColors.primary,
                        textStyle: TextStyles.regular20,
                        enableActiveFill: true,
                        keyboardType: TextInputType.number,
                        pinTheme: PinTheme(
                          disabledColor: AppColors.primary,
                          fieldOuterPadding: EdgeInsets.zero,
                          fieldHeight: 70.sp,
                          fieldWidth: 70.sp,
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(16.r),
                          activeColor: AppColors.primary,
                          inactiveColor: AppColors.greyLight,
                          activeFillColor: Colors.white,
                          inactiveFillColor: Colors.white,
                          selectedFillColor: AppColors.white,
                          selectedColor: AppColors.primary,
                        ),
                      ),
                    ),
                    const AppSpacer(heightRatio: 1),
                    ElevatedButton(
                      onPressed: () {
                        if (widget.isForgetPassword) {
                          context.read<VerfiyCodeCubit>().verfiyCodeEvent(
                                isForgetPassword: widget.isForgetPassword,
                                email: widget.email!,
                                otp: otpController.text,
                                otpToken: widget.otpToken,
                              );
                        } else {
                          context.read<VerfiyCodeCubit>().verfiyCodeEvent(
                                isForgetPassword: widget.isForgetPassword,
                                otp: otpController.text,
                                otpToken: widget.otpToken,
                              );
                        }
                      },
                      child: Text(tr('confirm')),
                    ),
                    const AppSpacer(heightRatio: 1.5),
                    if (widget.isForgetPassword) ...[
                      BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
                        builder: (BuildContext context, state) {
                          return StreamBuilder<int>(
                            stream: VerificatonCodeTimerStream.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<int> snapshot) {
                              if (snapshot.hasData) {
                                if (snapshot.data == 0) {
                                  return GestureDetector(
                                    onTap: () {
                                      context
                                          .read<ForgetPasswordCubit>()
                                          .forgetPasswordEvent(
                                              email: widget.email!);
                                    },
                                    child: Text.rich(
                                      TextSpan(children: <InlineSpan>[
                                        TextSpan(
                                          text: '${tr('did_not_get_code')} ',
                                          style: TextStyles.regular14
                                              .copyWith(color: AppColors.black),
                                        ),
                                        TextSpan(
                                          text: tr('resend_code'),
                                          style: TextStyles.bold14.copyWith(
                                            color: AppColors.primary,
                                          ),
                                        ),
                                      ]),
                                      textAlign: TextAlign.center,
                                    ),
                                  );
                                } else {
                                  return Column(
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '${tr('otp_will_be_sent_in')}  ',
                                            style: TextStyles.regular14,
                                          ),
                                          Text(
                                            '${snapshot.data} ${tr('sec')}',
                                            style: TextStyles.bold14.copyWith(
                                              color: AppColors.primary,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                }
                              } else {
                                return const SizedBox.shrink();
                              }
                            },
                          );
                        },
                      ),
                    ] else ...[
                      BlocBuilder<SendOtpCubit, SendOtpState>(
                        builder: (BuildContext context, SendOtpState state) {
                          if (state is SendOtpSuccess) {
                            widget.otpToken = state.otpToken;
                          }
                          if (state is SendOtpLoading) {
                            return const Center(
                                child: CircularProgressIndicator.adaptive());
                          }
                          return StreamBuilder<int>(
                            stream: VerificatonCodeTimerStream.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<int> snapshot) {
                              if (snapshot.hasData) {
                                if (snapshot.data == 0) {
                                  return GestureDetector(
                                    onTap: () {
                                      context
                                          .read<SendOtpCubit>()
                                          .sendOTPEvent();
                                    },
                                    child: Text.rich(
                                      TextSpan(children: <InlineSpan>[
                                        TextSpan(
                                          text: '${tr('did_not_get_code')} ',
                                          style: TextStyles.regular14
                                              .copyWith(color: AppColors.black),
                                        ),
                                        TextSpan(
                                          text: tr('resend_code'),
                                          style: TextStyles.bold14.copyWith(
                                            color: AppColors.primary,
                                          ),
                                        ),
                                      ]),
                                      textAlign: TextAlign.center,
                                    ),
                                  );
                                } else {
                                  return Column(
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '${tr('otp_will_be_sent_in')}  ',
                                            style: TextStyles.regular14,
                                          ),
                                          Text(
                                            '${snapshot.data} ${tr('sec')}',
                                            style: TextStyles.bold14.copyWith(
                                              color: AppColors.primary,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                }
                              } else {
                                return const SizedBox.shrink();
                              }
                            },
                          );
                        },
                      ),
                    ],
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
