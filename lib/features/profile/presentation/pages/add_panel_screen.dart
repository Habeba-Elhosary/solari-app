import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solari/core/constants/app_colors.dart';
import 'package:solari/core/constants/app_fonts.dart';
import 'package:solari/core/constants/app_text_styles.dart';
import 'package:solari/core/utils/app_validator/app_validator.dart';
import 'package:solari/core/widgets/app_spacer.dart';
import 'package:solari/core/widgets/single_drop_down_selector.dart';
import 'package:solari/features/general/domain/entities/all_systems_response.dart';
import 'package:solari/features/general/presentation/cubits/all_systems/all_systems_cubit.dart';
import 'package:solari/features/profile/presentation/cubits/add_panel/add_panel_cubit.dart';
import 'package:solari/injection_container.dart';

class AddPanelScreen extends StatefulWidget {
  const AddPanelScreen({super.key});

  @override
  State<AddPanelScreen> createState() => _AddPanelScreenState();
}

class _AddPanelScreenState extends State<AddPanelScreen> {
  final TextEditingController panelNameController = TextEditingController();
  final TextEditingController panelIdController = TextEditingController();
  final TextEditingController maxCapacityController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          tr('add_panel'),
          style: TextStyles.regular20.copyWith(
              color: AppColors.black, fontFamily: AppFonts.robotoSlab),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.sp),
          child: BlocProvider<AddPanelCubit>(
            create: (context) => sl<AddPanelCubit>(),
            child: BlocBuilder<AddPanelCubit, AddPanelState>(
              builder: (context, state) {
                return Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        controller: panelNameController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (String? value) => Validator.name(value),
                        keyboardType: TextInputType.name,
                        cursorColor: AppColors.primary,
                        onTapOutside: (PointerDownEvent event) {
                          FocusScope.of(context).unfocus();
                        },
                        decoration: InputDecoration(
                          label: Text(tr('panel_name')),
                        ),
                      ),
                      AppSpacer(heightRatio: 0.7),
                      TextFormField(
                        controller: panelIdController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (String? value) => Validator.numbers(value),
                        keyboardType: TextInputType.number,
                        cursorColor: AppColors.primary,
                        onTapOutside: (PointerDownEvent event) {
                          FocusScope.of(context).unfocus();
                        },
                        decoration: InputDecoration(
                          label: Text(tr('panel_id')),
                        ),
                      ),
                      AppSpacer(heightRatio: 0.7),
                      TextFormField(
                        controller: maxCapacityController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (String? value) => Validator.numbers(value),
                        keyboardType: TextInputType.number,
                        cursorColor: AppColors.primary,
                        onTapOutside: (PointerDownEvent event) {
                          FocusScope.of(context).unfocus();
                        },
                        decoration: InputDecoration(
                          label: Text(tr('max_capacity')),
                        ),
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
                              .read<AddPanelCubit>()
                              .selectCompany(entity: value);
                        },
                        label: tr('select_system'),
                        initState: () {
                          context.read<AllSystemsCubit>().getAllSystemsEvent();
                        },
                      ),
                      AppSpacer(heightRatio: 1),
                      BlocBuilder<AddPanelCubit, AddPanelState>(
                        builder: (context, state) {
                          if (state is AddPanelLoading) {
                            return CircularProgressIndicator.adaptive();
                          }
                          return ElevatedButton(
                              onPressed: () {
                                if (!_formKey.currentState!.validate()) {
                                  return;
                                }
                                context.read<AddPanelCubit>().addPanelEvent(
                                    name: panelNameController.text,
                                    panelId:
                                        int.tryParse(panelIdController.text) ??
                                            0,
                                    maxCapacity: int.tryParse(
                                            maxCapacityController.text) ??
                                        0);
                              },
                              child: Text(tr('add_panel')));
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
