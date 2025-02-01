import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solari/core/constants/app_assets.dart';
import 'package:solari/core/constants/app_colors.dart';
import 'package:solari/core/constants/app_fonts.dart';
import 'package:solari/core/constants/app_text_styles.dart';
import 'package:solari/core/constants/size_configuration.dart';
import 'package:solari/features/auth/presentation/pages/onboarding/onboarding_page.dart';
import 'package:solari/features/auth/presentation/pages/signin/signin_screen.dart';
import 'package:solari/injection_container.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      'first_title': '',
      'second_title': 'Monitor',
      'third_title': ' , manage and optimize your solar panel system.',
      'image': AppAssets.onboarding1,
    },
    {
      'first_title': 'Get instant alerts and detailed fault logs ',
      'second_title': 'to keep your',
      'third_title': ' system running seamlessly.',
      'image': AppAssets.onboarding2,
    },
    {
      'first_title': 'Explore',
      'second_title': ' Solari ',
      'third_title': 'and take charge of your renewable energy.',
      'image': AppAssets.onboarding3,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            physics: NeverScrollableScrollPhysics(),
            controller: _pageController,
            itemCount: onboardingData.length,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (context, index) {
              return OnboardingPage(
                firstTitle: onboardingData[index]['first_title']!,
                secondTitle: onboardingData[index]['second_title']!,
                thirdTitle: onboardingData[index]['third_title']!,
                image: onboardingData[index]['image']!,
              );
            },
          ),
          Positioned(
            top: 54.sp,
            right: 15.sp,
            child: TextButton(
              onPressed: () => appNavigator.push(screen: SignInScreen()),
              child: Text(
                _currentPage == onboardingData.length - 1
                    ? tr('done')
                    : tr('skip'),
                style: TextStyles.regular16.copyWith(
                  color: AppColors.white,
                  fontFamily: AppFonts.robotoSlab,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 25.sp,
            left: 0,
            right: 0,
            child: Padding(
              padding: SizeConfig.paddingSymmetric,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: List.generate(
                      onboardingData.length,
                      (index) => AnimatedContainer(
                        duration: 300.ms,
                        width: _currentPage == index ? 64.sp : 10.sp,
                        height: 10.sp,
                        margin: EdgeInsets.symmetric(horizontal: 4.sp),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10.r),
                          color: _currentPage == index
                              ? AppColors.primary
                              : AppColors.white,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (_currentPage == onboardingData.length - 1) {
                        appNavigator.push(screen: SignInScreen());
                      } else {
                        _pageController.nextPage(
                          duration: 300.ms,
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    style: IconButton.styleFrom(
                      backgroundColor: AppColors.white,
                      shape: const CircleBorder(),
                    ),
                    icon: Icon(
                      Icons.arrow_forward_rounded,
                      color: AppColors.primary,
                      size: 24.sp,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
