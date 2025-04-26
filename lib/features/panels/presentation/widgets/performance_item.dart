import 'package:flutter/material.dart';
import 'package:solari/core/constants/app_colors.dart';
import 'package:solari/core/constants/app_fonts.dart';
import 'package:solari/core/constants/app_text_styles.dart';
import 'package:solari/core/widgets/app_spacer.dart';

class PerformanceItem extends StatelessWidget {
  final String title;
  final String value;

  const PerformanceItem({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyles.regular14.copyWith(
            fontFamily: AppFonts.robotoSlab,
            color: AppColors.primary,
          ),
        ),
        AppSpacer(widthRatio: 0.3),
        Text(
          value,
          style: TextStyles.bold14.copyWith(fontFamily: AppFonts.robotoSlab),
        ),
      ],
    );
  }
}
