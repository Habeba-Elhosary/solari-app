import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solari/core/constants/app_assets.dart';
import 'package:solari/core/constants/app_colors.dart';
import 'package:solari/core/constants/app_fonts.dart';
import 'package:solari/core/constants/app_text_styles.dart';
import 'package:solari/core/widgets/app_spacer.dart';
import 'package:solari/features/profile/presentation/widgets/profile_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          tr('profile'),
          style: TextStyles.regular24.copyWith(
            fontFamily: AppFonts.robotoSlab,
            color: AppColors.black,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.sp),
            child: GestureDetector(
              // TODO
              onTap: () {},
              child: SvgPicture.asset(AppAssets.notifications),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 16.sp, bottom: 16.sp),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(vertical: 20.sp, horizontal: 24.sp),
                  margin: EdgeInsets.only(left: 16.sp, right: 16.sp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: AppColors.primary,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          //TODO
                        },
                        child: Container(
                          height: 70.sp,
                          width: 70.sp,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 1),
                          ),
                          child: ClipOval(
                            child: CachedNetworkImage(
                              imageUrl:
                                  'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      AppSpacer(widthRatio: 0.5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Karim Ali",
                            style: TextStyles.regular18.copyWith(
                                color: AppColors.white,
                                fontFamily: AppFonts.robotoSlab),
                          ),
                          AppSpacer(heightRatio: 0.2),
                          Text(
                            "Technician",
                            style: TextStyles.medium14
                                .copyWith(color: AppColors.white),
                          ),
                        ],
                      ),
                      Spacer(),
                      SvgPicture.asset(AppAssets.edit)
                    ],
                  ),
                ),
                AppSpacer(heightRatio: 0.5),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(16.sp),
                  margin: EdgeInsets.symmetric(horizontal: 16.sp),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ProfileItem(
                        asset: AppAssets.edit,
                        title: tr('edit_profile'),
                        onTap: () {},
                      ),
                      ProfileItem(
                        asset: AppAssets.addTech,
                        title: tr('add_tech'),
                        onTap: () {},
                      ),
                      ProfileItem(
                        asset: AppAssets.addSystem,
                        title: tr('add_system'),
                        onTap: () {},
                      ),
                      ProfileItem(
                        asset: AppAssets.logout,
                        title: tr('sign_out'),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
