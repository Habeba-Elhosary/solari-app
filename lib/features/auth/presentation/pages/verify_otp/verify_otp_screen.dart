import 'package:easy_localization/easy_localization.dart' as e;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solari/core/constants/app_colors.dart';
import 'package:solari/core/constants/app_text_styles.dart';
import 'package:solari/core/constants/size_configuration.dart';
import 'package:solari/core/widgets/app_spacer.dart';
import '../../cubit/send_otp/send_otp_cubit.dart';
import '../../cubit/verfiy_code/timer_verfiy_code.dart';
import '../../cubit/verfiy_code/verfiy_code_cubit.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPVerficationScreen extends StatefulWidget {
  final String phone;
  final bool isForgetPassword;
  final bool forceSendOTP;
  const OTPVerficationScreen({
    super.key,
    required this.isForgetPassword,
    required this.phone,
    required this.forceSendOTP,
  });

  @override
  State<OTPVerficationScreen> createState() => _OTPVerficationScreenState();
}

class _OTPVerficationScreenState extends State<OTPVerficationScreen> {
  final TextEditingController otpController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.forceSendOTP) {
      context.read<SendOtpCubit>().sendOTP(widget.phone);
    }
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
      body: SingleChildScrollView(
        child: Padding(
            padding: SizeConfig.paddingSymmetric.copyWith(top: 0, bottom: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SafeArea(
                    child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: BackButton(),
                )),
                Text(
                  e.tr('verify_code'),
                  style: TextStyles.bold24,
                ),
                const AppSpacer(
                  heightRatio: 0.25,
                ),
                Text.rich(
                  TextSpan(children: <InlineSpan>[
                    TextSpan(
                      text: e.tr('opt_sent'),
                      style: TextStyles.light16,
                    ),
                    TextSpan(
                      text: ' ',
                      style: TextStyles.light16,
                    ),
                    TextSpan(
                        text:
                            '${widget.phone.substring(widget.phone.length - 3, widget.phone.length)}******',
                        style: TextStyles.semiBold16),
                  ]),
                ),
                const AppSpacer(),
                PinCodeTextField(
                  controller: otpController,
                  appContext: context,
                  backgroundColor: Colors.transparent,
                  length: 4,
                  autoDisposeControllers: false,
                  // cursorColor: AppColors.primary,
                  // backgroundColor: Colors.white,
                  // textStyle: TextStyles.regular16,
                  enableActiveFill: true,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                    // disabledColor: AppColors.appPrimary,
                    fieldOuterPadding: EdgeInsets.zero,
                    fieldHeight: 60.h,
                    fieldWidth: 60.w,
                    shape: PinCodeFieldShape.circle,
                    // activeColor: AppColors.primarySwatch.shade100,
                    inactiveColor: Colors.white,
                    activeFillColor: Colors.white,
                    inactiveFillColor: Colors.white,
                    // selectedFillColor: AppColors.primarySwatch.shade50,
                    // selectedColor: AppColors.primary,
                  ),
                ),
                const AppSpacer(),
                TextButton(
                  onPressed: () {
                    context.read<VerfiyCodeCubit>().verfiyCodeEvent(
                          code: otpController.text,
                          isForgetPassword: widget.isForgetPassword,
                        );
                  },
                  child: Text(tr('confirm')),
                ),
                const AppSpacer(
                  heightRatio: .25,
                ),
                SafeArea(
                  top: false,
                  child: BlocBuilder<SendOtpCubit, SendOtpState>(
                    builder: (BuildContext context, SendOtpState state) {
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
                              return TextButton(
                                onPressed: () {
                                  context
                                      .read<SendOtpCubit>()
                                      .sendOTP(widget.phone);
                                },
                                child: Text.rich(
                                  TextSpan(children: <InlineSpan>[
                                    TextSpan(
                                        text: e.tr('did_not_get_code'),
                                        style: TextStyles.light16
                                            .copyWith(color: AppColors.black)),
                                    TextSpan(
                                        text: ' ', style: TextStyles.light16),
                                    TextSpan(
                                        text: e.tr('resend_code'),
                                        style:
                                            TextStyles.semiBold16.copyWith()),
                                  ]),
                                  textAlign: TextAlign.center,
                                ),
                              );
                            } else {
                              return Column(
                                children: <Widget>[
                                  const AppSpacer(heightRatio: 0.5),
                                  Center(
                                    child: CircleAvatar(
                                      backgroundColor: AppColors.white,
                                      minRadius: 30.r,
                                      child: Text(
                                        snapshot.data.toString(),
                                        style: TextStyles.semiBold16,
                                      ),
                                    ),
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
                ),
              ],
            )),
      ),
    );
  }
}
