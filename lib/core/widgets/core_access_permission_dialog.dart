// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../constant/values/colors.dart';
// import '../constant/values/text_styles.dart';
// import '../util/router.dart';
// import 'app_spacer.dart';
// import '../../generated/locale_keys.g.dart';

// class CoreAccessPermissionDialog extends StatelessWidget {
//   final String header;
//   final String? actionTitle;
//   final Function()? onAction;
//   const CoreAccessPermissionDialog({
//     super.key,
//     required this.header,
//     this.actionTitle,
//     this.onAction,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(10.sp),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             header,
//             style: TextStyles.bold18,
//             textAlign: TextAlign.center,
//           ),
//           AppSpacer(heightRatio: 0.5),
//           Row(
//             children: [
//               if (onAction != null)
//                 Expanded(
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(elevation: 0),
//                     onPressed: () => onAction!(),
//                     child: Text(
//                       actionTitle ?? "",
//                       style: TextStyles.bold16,
//                     ),
//                   ),
//                 ),
//               if (onAction != null) AppSpacer(heightRatio: 0.3),
//               Expanded(
//                 child: ElevatedButton(
//                   onPressed: () {
//                     MagicRouter.pop();
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: AppColors.white,
//                     elevation: 0,
//                     side: BorderSide(color: AppColors.grey),
//                   ),
//                   child: Text(
//                     LocaleKeys.cancel.tr(),
//                     style: TextStyles.bold16.copyWith(color: AppColors.black),
//                   ),
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
