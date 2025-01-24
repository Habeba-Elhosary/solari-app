// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'progress_button.dart';
// import '../../generated/locale_keys.g.dart';

// class CustomErrorWidget extends StatelessWidget {
//   const CustomErrorWidget({super.key, this.error, this.onTryAgain});
//   final String? error;
//   final Function()? onTryAgain;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(20.0.w),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           SizedBox(height: 20.h),
//           Text(
//             LocaleKeys.please_try_again.tr(),
//             style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           if (kDebugMode)
//             Text(
//               error ?? "",
//               textAlign: TextAlign.center,
//               style: const TextStyle(
//                 fontSize: 16,
//                 color: Colors.red,
//               ),
//             ),
//           SizedBox(height: 20.h),
//           AppProgressButton(
//             text: LocaleKeys.please_try_again.tr(),
//             onPressed: (anim) {
//               if (onTryAgain != null) {
//                 onTryAgain!();
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
