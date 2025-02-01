// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_svg/svg.dart';

// import '../../../../../injection_container.dart';
// import '../../../../constant/values/assets.dart';
// import '../../../../constant/values/size_config.dart';
// import '../../../../constant/values/text_styles.dart';
// import '../../../../widgets/app_spacer.dart';
// import '../../cubit/auto_signin/auto_signin_cubit.dart';
// import '../signup/signup_screen.dart';

// class MobileOnBoarding extends StatelessWidget {
//   const MobileOnBoarding({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Padding(
//       padding: SizeConfig.paddingSymmetric,
//       child: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             Image.asset(
//               AppAssets.onboarding,
//               height: 300.h,
//             ),
//             const AppSpacer(
//               heightRatio: 2,
//             ),

//             SvgPicture.asset(
//               AppAssets.fullLogoColored,
//               width: 150.w,
//             ),
//             const AppSpacer(widthRatio: 0.5),
//             // Text.rich(TextSpan(children: <InlineSpan>[
//             //   TextSpan(
//             //       text: 'نص ',
//             //       style: TextStyles.extraBold24
//             //           .copyWith(color: AppColors.primarySwatch.shade700)),
//             //   TextSpan(text: 'مؤقت', style: TextStyles.extraBold24),
//             // ]))

//             const AppSpacer(
//               heightRatio: .5,
//             ),
//             Text(
//               'نظام الإدارة لتجارة الحديد والأسمنت',
//               style: TextStyles.bold24,
//               maxLines: 2,
//               textAlign: TextAlign.center,
//             ),
//             const AppSpacer(
//               heightRatio: .2,
//             ),
//             Text(
//               'اجعل معاملاتك اليومية مفتاحا لجميع حساباتك الخاصة بالعملاء والموردين بشكل دقيق ومحترف وقابل للمراجعة والمتابعة في أي وقت ومن اي مكان',
//               maxLines: 2,
//               style: TextStyles.light16,
//               textAlign: TextAlign.center,
//             ),
//             const Spacer(),
//             ElevatedButton(
//                 onPressed: () {
//                   context.read<AutoSignInCubit>().emitSeenIntro();
//                 },
//                 child: Text(tr('login'))),
//             const AppSpacer(
//               heightRatio: .5,
//             ),
//             OutlinedButton(
//                 onPressed: () {
//                   appNavigator.push(screen: const RequestRegisterScreen());
//                 },
//                 child: Text(tr('new_client')))
//           ],
//         ),
//       ),
//     ));
//   }
// }
