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
import 'package:solari/features/profile/presentation/cubits/add_technician/add_technician_cubit.dart';
import 'package:solari/injection_container.dart';

class AddTechnicianScreen extends StatefulWidget {
  const AddTechnicianScreen({super.key});

  @override
  State<AddTechnicianScreen> createState() => _AddTechnicianScreenState();
}

class _AddTechnicianScreenState extends State<AddTechnicianScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
          child: BlocProvider<AddTechnicianCubit>(
            create: (context) => sl<AddTechnicianCubit>(),
            child: BlocBuilder<AddTechnicianCubit, AddTechnicianState>(
              builder: (context, state) {
                return Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        controller: nameController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (String? value) =>
                            Validator.defaultValidator(value),
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
                        controller: emailController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (String? value) => Validator.email(value),
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
                        controller: passwordController,
                        validator: (String? value) => Validator.password(value),
                      ),
                      AppSpacer(heightRatio: 0.7),
                      CoreSingleSelectorDropdown<
                          AllSystemsCubit,
                          AllSystemsState,
                          AllSystemsLoading,
                          AllSystemsError,
                          System>(
                        validator: (System? value) =>
                            Validator.defaultValidator(value?.name),
                        options: context.watch<AllSystemsCubit>().systems,
                        onChanged: (System value) {
                          context
                              .read<AddTechnicianCubit>()
                              .selectCompany(entity: value);
                        },
                        label: tr('select_system'),
                        initState: () {
                          context.read<AllSystemsCubit>().getAllSystemsEvent();
                        },
                      ),
                      AppSpacer(heightRatio: 1),
                      BlocBuilder<AddTechnicianCubit, AddTechnicianState>(
                        builder: (context, state) {
                          if (state is AddTechnicianLoading) {
                            return CircularProgressIndicator.adaptive();
                          }
                          return ElevatedButton(
                              onPressed: () {
                                if (!_formKey.currentState!.validate()) {
                                  return;
                                }
                                context
                                    .read<AddTechnicianCubit>()
                                    .addTechnicianEvent(
                                      technicianName: nameController.text,
                                      technicianEmail: emailController.text,
                                      technicianPassword:
                                          passwordController.text,
                                    );
                              },
                              child: Text(tr('add_technician')));
                        },
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
