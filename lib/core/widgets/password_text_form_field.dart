import 'package:flutter/material.dart';
import 'package:solari/core/constants/app_colors.dart';
import 'package:solari/core/utils/app_validator/app_validator.dart';

class PasswordTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String? labelText;
  final String? Function(String? value)? validator;

  const PasswordTextFormField({
    super.key,
    this.labelText,
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
        TextFormField(
          obscureText: isObscure,
          obscuringCharacter: '●',
          validator: (String? value) => widget.validator != null
              ? widget.validator!(value)
              : Validator.password(value),
          onTapOutside: (PointerDownEvent event) {
            FocusScope.of(context).unfocus();
          },
          cursorColor: AppColors.primary,
          controller: widget.controller,
          decoration: InputDecoration(
            labelText: widget.labelText,
            suffixIcon: GestureDetector(
              onTap: () => setState(() => isObscure = !isObscure),
              child: Icon(
                isObscure
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: AppColors.greyLight,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
