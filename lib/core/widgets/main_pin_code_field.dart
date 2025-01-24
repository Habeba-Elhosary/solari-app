import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constant/values/text_styles.dart';
import '../constant/values/colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeFields extends StatelessWidget {
  const PinCodeFields({
    super.key,
    required this.otpController,
  });

  final TextEditingController otpController;

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      builder: (field) {
        return Column(
          children: [
            Directionality(
              textDirection: TextDirection.ltr,
              child: ConstrainedBox(
                constraints: BoxConstraints.tightFor(height: 56.h),
                child: PinCodeTextField(
                  controller: otpController,
                  appContext: context,
                  autoFocus: false,
                  autoDisposeControllers: true,
                  autovalidateMode: AutovalidateMode.disabled,
                  cursorColor: AppColors.primary,
                  textStyle: TextStyles.semiBold24,
                  keyboardType: const TextInputType.numberWithOptions(
                    signed: false,
                    decimal: false,
                  ),
                  length: 6,
                  animationType: AnimationType.scale,
                  enablePinAutofill: true,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    fieldHeight: 56.h,
                    fieldWidth: 56.w,
                    borderRadius: BorderRadius.circular(10.r),
                    activeColor: AppColors.primary,
                    inactiveColor: AppColors.greyDark,
                    selectedColor: AppColors.primary,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: false,
                ),
              ),
            ),
            if (field.hasError)
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text(
                  field.errorText ?? '',
                  style: const TextStyle(color: Colors.red),
                ),
              ),
          ],
        );
      },
    );
  }
}
