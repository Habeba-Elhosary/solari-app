import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solari/core/constants/app_colors.dart';
import 'package:solari/core/constants/app_fonts.dart';
import 'package:solari/core/constants/app_text_styles.dart';
import 'package:solari/core/utils/app_validator/app_validator.dart';
import 'package:solari/core/widgets/app_spacer.dart';
import 'package:solari/core/widgets/password_text_form_field.dart';
import 'package:solari/core/widgets/single_drop_down_selector.dart';
import 'package:solari/features/general/domain/entities/all_systems_response.dart';
import 'package:solari/features/general/presentation/cubits/all_systems/all_systems_cubit.dart';
import 'package:solari/features/home/presentation/cubits/system_home/system_home_cubit.dart';

class AddTechnicianScreen extends StatelessWidget {
  const AddTechnicianScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          tr('add_technician'),
          style: TextStyles.regular20.copyWith(
              color: AppColors.black, fontFamily: AppFonts.robotoSlab),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                // controller: emailController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (String? value) => Validator.defaultValidator(value),
                keyboardType: TextInputType.name,
                cursorColor: AppColors.primary,
                onTapOutside: (PointerDownEvent event) {
                  FocusScope.of(context).unfocus();
                },
                decoration: InputDecoration(
                  label: Text(tr('name')),
                ),
              ),
              AppSpacer(heightRatio: 0.7),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (String? value) => Validator.numbers(value),
                keyboardType: TextInputType.name,
                cursorColor: AppColors.primary,
                onTapOutside: (PointerDownEvent event) {
                  FocusScope.of(context).unfocus();
                },
                decoration: InputDecoration(
                  label: Text(tr('email')),
                ),
              ),
              AppSpacer(heightRatio: 0.7),
              PasswordTextFormField(
                labelText: tr('password'),
                controller: TextEditingController(),
                validator: (String? value) => Validator.password(value),
              ),
              AppSpacer(heightRatio: 0.7),
              CoreSingleSelectorDropdown<AllSystemsCubit, AllSystemsState,
                  AllSystemsLoading, AllSystemsError, System>(
                validator: (System? value) =>
                    Validator.defaultValidator(value?.name),
                options: context.watch<AllSystemsCubit>().systems,
                onChanged: (System value) {
                  context.read<SystemHomeCubit>().selectCompany(entity: value);
                },
                label: tr('select_system'),
                initState: () {
                  context.read<AllSystemsCubit>().getAllSystemsEvent();
                },
                initValue: context.read<SystemHomeCubit>().system,
              ),
              AppSpacer(heightRatio: 1),
              ElevatedButton(
                  onPressed: () {}, child: Text(tr('add_technician')))
            ],
          ),
        ),
      ),
    );
  }
}
