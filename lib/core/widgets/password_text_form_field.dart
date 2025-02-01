import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:solari/core/constants/app_colors.dart';
import 'package:solari/core/constants/app_text_styles.dart';
import 'package:solari/core/utils/app_validator/app_validator.dart';

class PasswordTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  final String? Function(String? value)? validator;
  const PasswordTextFormField({
    super.key,
    this.hintText,
    this.validator,
    required this.controller,
  });

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(widget.hintText ?? tr('password'), style: TextStyles.regular16),
        TextFormField(
          obscureText: isObscure,
          obscuringCharacter: '●',
          validator: (String? value) => widget.validator != null
              ? widget.validator!(value)
              : Validator.password(value),
          onTapOutside: (PointerDownEvent event) {
            FocusScope.of(context).unfocus();
          },
          style: TextStyles.light10.copyWith(color: AppColors.black),
          controller: widget.controller,
          decoration: InputDecoration(
            hintText: tr('●●●●●●●●●'),
            suffixIcon: IconButton(
              onPressed: () => setState(() => isObscure = !isObscure),
              icon: Icon(
                isObscure ? Icons.visibility_off : Icons.visibility,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
