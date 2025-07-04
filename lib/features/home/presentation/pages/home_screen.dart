import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solari/core/constants/app_colors.dart';
import 'package:solari/core/utils/app_validator/app_validator.dart';
import 'package:solari/core/widgets/app_spacer.dart';
import 'package:solari/core/widgets/single_drop_down_selector.dart';
import 'package:solari/features/general/domain/entities/all_systems_response.dart';
import 'package:solari/features/general/presentation/cubits/all_systems/all_systems_cubit.dart';
import 'package:solari/features/home/presentation/cubits/system_home/system_home_cubit.dart';
import 'package:solari/features/home/presentation/widgets/home_header.dart';
import 'package:solari/features/home/presentation/widgets/home_panels_section.dart';
import 'package:solari/features/home/presentation/widgets/home_power_section.dart';
import 'package:solari/features/home/presentation/widgets/home_temperature_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<SystemHomeCubit>().getSystemHomeEvent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        color: AppColors.primary,
        onRefresh: () async {
          context.read<SystemHomeCubit>().getSystemHomeEvent();
        },
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 16.sp),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.sp),
                    child: Column(
                      children: [
                        HomeHeader(),
                        AppSpacer(heightRatio: 0.7),
                        BlocListener<AllSystemsCubit, AllSystemsState>(
                          listenWhen: (prev, curr) => curr is AllSystemsLoaded,
                          listener: (context, state) {
                            final systemHomeCubit =
                                context.read<SystemHomeCubit>();
                            final allSystemsCubit =
                                context.read<AllSystemsCubit>();

                            if (allSystemsCubit.systems.isNotEmpty &&
                                systemHomeCubit.system == null) {
                              final firstSystem = allSystemsCubit.systems.first;
                              systemHomeCubit.selectSystem(entity: firstSystem);
                            }
                          },
                          child: CoreSingleSelectorDropdown<
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
                                  .read<SystemHomeCubit>()
                                  .selectSystem(entity: value);
                            },
                            label: tr('select_system'),
                            initState: () {
                              context
                                  .read<AllSystemsCubit>()
                                  .getAllSystemsEvent();
                            },
                            initValue: context.read<SystemHomeCubit>().system,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AppSpacer(heightRatio: 0.7),
                  HomePowerSection(),
                  AppSpacer(heightRatio: 0.7),
                  HomePanelsSection(),
                  AppSpacer(heightRatio: 0.7),
                  HomeTemperatureSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
