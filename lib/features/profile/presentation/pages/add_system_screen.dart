import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solari/core/constants/app_colors.dart';
import 'package:solari/core/constants/app_fonts.dart';
import 'package:solari/core/constants/app_text_styles.dart';
import 'package:solari/core/utils/app_validator/app_validator.dart';
import 'package:solari/core/widgets/app_spacer.dart';
import 'package:solari/core/widgets/loading.dart';
import 'package:solari/core/widgets/single_drop_down_selector.dart';
import 'package:solari/features/general/domain/entities/all_systems_response.dart';
import 'package:solari/features/general/presentation/cubits/all_technicians/all_technicians_cubit.dart';
import 'package:solari/features/profile/presentation/cubits/add_system/add_system_cubit.dart';
import 'package:solari/injection_container.dart';

class AddSystemScreen extends StatefulWidget {
  const AddSystemScreen({super.key});

  @override
  State<AddSystemScreen> createState() => _AddSystemScreenState();
}

class _AddSystemScreenState extends State<AddSystemScreen> {
  final TextEditingController systemNameController = TextEditingController();
  final TextEditingController systemIdController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          tr('add_system'),
          style: TextStyles.regular20.copyWith(
              color: AppColors.black, fontFamily: AppFonts.robotoSlab),
        ),
      ),
      body: BlocProvider<AddSystemCubit>(
        create: (context) => sl<AddSystemCubit>(),
        child: BlocBuilder<AddSystemCubit, AddSystemState>(
          builder: (context, state) {
            return SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.sp),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        controller: systemNameController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (String? value) => Validator.name(value),
                        keyboardType: TextInputType.name,
                        cursorColor: AppColors.primary,
                        onTapOutside: (PointerDownEvent event) {
                          FocusScope.of(context).unfocus();
                        },
                        decoration: InputDecoration(
                          label: Text(tr('system_name')),
                        ),
                      ),
                      AppSpacer(heightRatio: 0.7),
                      TextFormField(
                        controller: systemIdController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (String? value) => Validator.numbers(value),
                        keyboardType: TextInputType.number,
                        cursorColor: AppColors.primary,
                        onTapOutside: (PointerDownEvent event) {
                          FocusScope.of(context).unfocus();
                        },
                        decoration: InputDecoration(
                          label: Text(tr('system_id')),
                        ),
                      ),
                      AppSpacer(heightRatio: 0.7),
                      TextFormField(
                        controller: locationController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (String? value) => Validator.name(value),
                        keyboardType: TextInputType.text,
                        cursorColor: AppColors.primary,
                        onTapOutside: (PointerDownEvent event) {
                          FocusScope.of(context).unfocus();
                        },
                        decoration: InputDecoration(
                          label: Text(tr('location')),
                        ),
                      ),
                      AppSpacer(heightRatio: 0.7),
                      CoreSingleSelectorDropdown<
                          AllTechniciansCubit,
                          AllTechniciansState,
                          AllTechniciansLoading,
                          AllTechniciansError,
                          System>(
                        validator: (System? value) =>
                            Validator.defaultValidator(value?.name),
                        options:
                            context.watch<AllTechniciansCubit>().technicians,
                        onChanged: (System value) {
                          context
                              .read<AddSystemCubit>()
                              .selectTechnician(entity: value);
                        },
                        label: tr('select_technician'),
                        initState: () {
                          context
                              .read<AllTechniciansCubit>()
                              .getAllTechniciansEvent();
                        },
                      ),
                      AppSpacer(heightRatio: 1),
                      Visibility(
                        visible: state is! AddSystemLoading,
                        replacement: Loading(),
                        child: ElevatedButton(
                            onPressed: () {
                              if (!_formKey.currentState!.validate()) {
                                return;
                              }
                              context.read<AddSystemCubit>().addSystemEvent(
                                    systemId:
                                        int.parse(systemIdController.text),
                                    systemName: systemNameController.text,
                                    location: locationController.text,
                                  );
                            },
                            child: Text(tr('add_system'))),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
