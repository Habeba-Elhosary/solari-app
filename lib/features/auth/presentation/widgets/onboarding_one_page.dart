import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:solari/core/constants/size_configuration.dart';
import 'package:solari/features/auth/presentation/widgets/onboarding_title.dart';

class OnboardingOnePage extends StatelessWidget {
  final String firstTitle;
  final String secondTitle;
  final String thirdTitle;
  final String image;

  const OnboardingOnePage({
    super.key,
    required this.firstTitle,
    required this.secondTitle,
    required this.thirdTitle,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: SizeConfig.paddingSymmetric,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OnboardingTitle(
              firstTitle: firstTitle,
              secondTitle: secondTitle,
              thirdTitle: thirdTitle,
            ).animate().fadeIn(duration: 250.ms).then().slide(
                  duration: 250.ms,
                  begin: const Offset(0, -0.1),
                  end: Offset.zero,
                ),
          ],
        ),
      ),
    );
  }
}
