// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_svg/svg.dart';

// import '../../../../../injection_container.dart';
// import '../../../../constant/values/assets.dart';
// import '../../../../constant/values/colors.dart';
// import '../../../../constant/values/text_styles.dart';
// import '../../../../widgets/app_spacer.dart';
// import '../../../../widgets/desktop_intro_layout.dart';
// import '../../cubit/auto_signin/auto_signin_cubit.dart';
// import '../signup/signup_screen.dart';

// class DesktopOnboarding extends StatelessWidget {
//   const DesktopOnboarding({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: DesktopInroLayout(
//         leftSide: DesktopOnboardingLeftSide(),
//         rightSide: DesktopOnboardingRightSide(),
//       ),
//     );
//   }
// }

// class DesktopOnboardingLeftSide extends StatelessWidget {
//   const DesktopOnboardingLeftSide({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         SvgPicture.asset(
//           AppAssets.fullLogoColored,
//           width: 150.w,
//         ),
//         const AppSpacer(),
//         ElevatedButton(
//             onPressed: () {
//               context.read<AutoSignInCubit>().emitSeenIntro();
//             },
//             child: Text(tr('login'))),
//         const AppSpacer(
//           heightRatio: .5,
//         ),
//         OutlinedButton(
//             onPressed: () {
//               appNavigator.push(screen: const RequestRegisterScreen());
//             },
//             child: Text(tr('new_client')))
//       ],
//     );
//   }
// }

// class DesktopOnboardingRightSide extends StatelessWidget {
//   const DesktopOnboardingRightSide({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         Image.asset(
//           AppAssets.onboarding,
//           height: 200.h,
//         ),
//         const AppSpacer(
//           heightRatio: 2,
//         ),
//         Text(
//           'نظام الإدارة لتجارة الحديد والأسمنت',
//           style: TextStyles.bold24.copyWith(color: AppColors.white),
//           maxLines: 2,
//           textAlign: TextAlign.center,
//         ),
//         const AppSpacer(
//           heightRatio: .2,
//         ),
//         Text(
//           'اجعل معاملاتك اليومية مفتاحا لجميع حساباتك الخاصة بالعملاء والموردين بشكل دقيق ومحترف وقابل للمراجعة والمتابعة في أي وقت ومن اي مكان',
//           maxLines: 2,
//           style: TextStyles.light16.copyWith(color: AppColors.white),
//           textAlign: TextAlign.center,
//         ),
//       ],
//     );
//   }
// }
