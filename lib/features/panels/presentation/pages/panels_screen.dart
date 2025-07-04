import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:solari/core/constants/app_assets.dart';
import 'package:solari/core/constants/app_colors.dart';
import 'package:solari/core/constants/app_fonts.dart';
import 'package:solari/core/constants/app_text_styles.dart';
import 'package:solari/core/utils/app_validator/app_validator.dart';
import 'package:solari/core/utils/enums/user_types.dart';
import 'package:solari/core/widgets/app_spacer.dart';
import 'package:solari/core/widgets/single_drop_down_selector.dart';
import 'package:solari/features/auth/presentation/cubits/signin/signin_cubit.dart';
import 'package:solari/features/general/domain/entities/all_systems_response.dart';
import 'package:solari/features/general/presentation/cubits/all_systems/all_systems_cubit.dart';
import 'package:solari/features/panels/presentation/cubits/all_panels/all_panels_cubit.dart';
import 'package:solari/features/panels/presentation/widgets/all_panels_section.dart';
import 'package:solari/features/profile/presentation/pages/notifications_screen.dart';
import 'package:solari/injection_container.dart';

class PanelsScreen extends StatefulWidget {
  const PanelsScreen({super.key});

  @override
  State<PanelsScreen> createState() => _PanelsScreenState();
}

class _PanelsScreenState extends State<PanelsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AllPanelsCubit>().getAllPanelsEvent();
  }

  @override
  Widget build(BuildContext context) {
    final user = context.read<SignInCubit>().user;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          tr('panels'),
          style: TextStyles.regular24.copyWith(
            fontFamily: AppFonts.robotoSlab,
            color: AppColors.black,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.sp),
            child: GestureDetector(
              onTap: () {
                appNavigator.push(screen: NotificationsScreen());
              },
              child: SvgPicture.asset(AppAssets.notifications),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.sp),
          child: Column(
            children: [
              if (user.userType == UserType.manager) ...[
                BlocListener<AllSystemsCubit, AllSystemsState>(
                  listenWhen: (prev, curr) => curr is AllSystemsLoaded,
                  listener: (context, state) {
                    final allPanelsCubit = context.read<AllPanelsCubit>();
                    final allSystemsCubit = context.read<AllSystemsCubit>();

                    if (allSystemsCubit.systems.isNotEmpty &&
                        allPanelsCubit.system == null) {
                      final firstSystem = allSystemsCubit.systems.first;
                      allPanelsCubit.selectSystem(entity: firstSystem);
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
                          .read<AllPanelsCubit>()
                          .selectSystem(entity: value);
                    },
                    label: tr('select_system'),
                    initState: () {
                      context.read<AllSystemsCubit>().getAllSystemsEvent();
                    },
                    initValue: context.read<AllPanelsCubit>().system,
                  ),
                ),
                AppSpacer(heightRatio: 0.7),
              ],
              BlocBuilder<AllPanelsCubit, AllPanelsState>(
                builder: (context, state) {
                  if (state is AllPanelsLoading) {
                    return MainAllPanelsSectionShimmer();
                  }
                  if (state is AllPanelsError) {
                    return Center(
                      child: Text(state.message),
                    );
                  }
                  if (state is AllPanelsSuccess) {
                    return Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(24.sp),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: AppColors.primary,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.allPanelsResponse.data.activeCells,
                            style: TextStyles.bold22.copyWith(
                              fontFamily: AppFonts.robotoSlab,
                              color: AppColors.white,
                            ),
                          ),
                          AppSpacer(heightRatio: 0.4),
                          Text(
                            '${state.allPanelsResponse.data.temperature}\n${state.allPanelsResponse.data.trackingStatus}',
                            style: TextStyles.regular14.copyWith(
                              fontFamily: AppFonts.robotoSlab,
                              color: AppColors.white,
                              height: 2.sp,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return SizedBox.shrink();
                },
              ),
              AppSpacer(heightRatio: 0.7),
              AllPanelsSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class MainAllPanelsSectionShimmer extends StatelessWidget {
  const MainAllPanelsSectionShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: AppColors.primary,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              width: 145.sp,
              height: 20.sp,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.r),
                color: Colors.grey.shade300,
              ),
            ),
          ),
          AppSpacer(heightRatio: 0.4),
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              width: 250.sp,
              height: 20.sp,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.r),
                color: Colors.grey.shade300,
              ),
            ),
          ),
          AppSpacer(heightRatio: 0.4),
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              width: 250.sp,
              height: 20.sp,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.r),
                color: Colors.grey.shade300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
