import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solari/core/constants/app_assets.dart';
import 'package:solari/core/constants/app_colors.dart';
import 'package:solari/core/constants/app_fonts.dart';
import 'package:solari/core/constants/app_text_styles.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tr('welcome_back'),
              style: TextStyles.semiBold16.copyWith(
                color: AppColors.greyDark,
                fontFamily: AppFonts.roboto,
              ),
            ),
            Text(
              'Kareem',
              style: TextStyles.semiBold24.copyWith(
                color: AppColors.black,
                fontFamily: AppFonts.robotoSlab,
                fontSize: 24.sp,
              ),
            ),
          ],
        ),
        Spacer(),
        SvgPicture.asset(AppAssets.notifications)
      ],
    );
  }
}
