import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solari/core/constants/app_colors.dart';
import 'package:solari/core/constants/app_fonts.dart';
import 'package:solari/core/constants/app_text_styles.dart';
import 'package:solari/core/widgets/app_spacer.dart';

class ProfileItem extends StatelessWidget {
  final String asset;
  final String title;
  final VoidCallback? onTap;
  const ProfileItem({
    super.key,
    required this.asset,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(10.sp),
              decoration: BoxDecoration(
                color: Color(0XFFEDF2FF),
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                asset,
                height: 20.sp,
                colorFilter:
                    ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
              ),
            ),
            AppSpacer(widthRatio: 0.5),
            Text(
              title,
              style: TextStyles.regular16
                  .copyWith(fontFamily: AppFonts.robotoSlab),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16.sp,
              color: AppColors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
