import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:solari/core/constants/app_colors.dart';
import 'package:solari/core/constants/app_fonts.dart';
import 'package:solari/core/constants/app_text_styles.dart';
import 'package:solari/core/utils/app_validator/app_validator.dart';
import 'package:solari/core/utils/permssions/location_permissions.dart';
import 'package:solari/core/widgets/app_spacer.dart';
import 'package:solari/core/widgets/loading.dart';
import 'package:solari/core/widgets/single_drop_down_selector.dart';
import 'package:solari/core/widgets/toast.dart';
import 'package:solari/features/general/domain/entities/all_systems_response.dart';
import 'package:solari/features/general/presentation/cubits/all_systems/all_systems_cubit.dart';
import 'package:solari/features/profile/presentation/cubits/add_panel/add_panel_cubit.dart';
import 'package:solari/injection_container.dart';
import 'package:geocoding/geocoding.dart' as geocoding;

class AddPanelScreen extends StatefulWidget {
  const AddPanelScreen({super.key});

  @override
  State<AddPanelScreen> createState() => _AddPanelScreenState();
}

class _AddPanelScreenState extends State<AddPanelScreen> {
  final TextEditingController panelNameController = TextEditingController();
  final TextEditingController panelIdController = TextEditingController();
  final TextEditingController maxCapacityController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  double? currentLat;
  double? currentLng;
  bool isLoadingLocation = false;
  FocusNode locationFocusNode = FocusNode();

  FutureOr<Position?> getAndSetLocation() async {
    setState(() {
      isLoadingLocation = true;
    });

    final position = await LocationHandler.getCurrentPosition();
    if (position == null) {
      showErrorToast(tr('location_error'));
      setState(() {
        isLoadingLocation = false;
      });
      return null;
    }

    currentLat = position.latitude;
    currentLng = position.longitude;
    try {
      final placemarks = await geocoding.placemarkFromCoordinates(
        currentLat!,
        currentLng!,
      );
      final place = placemarks.first;
      final address =
          "${place.street ?? ''}, ${place.locality ?? ''}, ${place.country ?? ''}";

      locationController.text = address;
      setState(() {
        isLoadingLocation = false;
      });
      return position;
    } catch (e) {
      locationController.text = "$currentLat, $currentLng";
      setState(() {
        isLoadingLocation = false;
      });
      return position;
    }
  }

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
                      TextFormField(
                        controller: locationController,
                        focusNode: locationFocusNode,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        cursorColor: AppColors.primary,
                        readOnly: true,
                        onTapOutside: (_) => FocusScope.of(context).unfocus(),
                        onTap: () async {
                          Position? position = await getAndSetLocation();
                          if (position == null) return;
                          Future.microtask(() => context
                              .read<AddPanelCubit>()
                              .setPosition(p: position));
                        },
                        decoration: InputDecoration(
                          labelText: locationController.text.isNotEmpty
                              ? tr('location')
                              : null,
                          hintText: tr('tap_here_to_set_location'),
                          hintStyle: TextStyles.regular14,
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          suffixIcon: SizedBox(
                            height: 24,
                            width: 24,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: isLoadingLocation
                                  ? FittedBox(
                                      child: Padding(
                                        padding: EdgeInsets.all(20),
                                        child: CircularProgressIndicator
                                            .adaptive(),
                                      ),
                                    )
                                  : Icon(
                                      Icons.location_on,
                                      color: AppColors.primary,
                                    ),
                            ),
                          ),
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
                          return Visibility(
                            visible: state is! AddPanelLoading,
                            replacement: Center(child: Loading()),
                            child: ElevatedButton(
                                onPressed: () {
                                  if (!_formKey.currentState!.validate()) {
                                    return;
                                  }
                                  context.read<AddPanelCubit>().addPanelEvent(
                                      name: panelNameController.text,
                                      panelId: int.tryParse(
                                              panelIdController.text) ??
                                          0,
                                      maxCapacity: int.tryParse(
                                              maxCapacityController.text) ??
                                          0);
                                },
                                child: Text(tr('add_panel'))),
                          );
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
