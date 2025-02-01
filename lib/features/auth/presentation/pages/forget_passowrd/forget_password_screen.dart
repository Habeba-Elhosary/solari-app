import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solari/core/constants/app_text_styles.dart';
import 'package:solari/core/constants/size_configuration.dart';
import 'package:solari/core/widgets/app_spacer.dart';
import '../../cubit/forget_password/forget_password_cubit.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: SizeConfig.paddingSymmetric.copyWith(top: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SafeArea(
                child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: BackButton(),
            )),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const AppSpacer(),
                  Text(
                    tr('did_you_forget_password'),
                    style: TextStyles.bold24,
                  ),
                  Text(
                    tr('forget_password_hint'),
                    style: TextStyles.light16,
                  ),
                  const AppSpacer(),
                  Text(
                    tr('phone'),
                    style: TextStyles.regular16,
                  ),
                  const AppSpacer(
                    heightRatio: .25,
                  ),
                  Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      //ToDo: phone
                      // validator: (String? value) => Validator.phone(value),
                      decoration: InputDecoration(
                        hintText: tr('enter_your_phone'),
                      ),
                    ),
                  ),
                  const AppSpacer(),
                  TextButton(
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }
                      context
                          .read<ForgetPasswordCubit>()
                          .forgetPasswordEvent(phone: phoneController.text);
                    },
                    child: Text(tr('send_code')),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
