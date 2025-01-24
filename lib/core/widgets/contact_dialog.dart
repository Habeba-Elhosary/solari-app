// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import '../constant/values/text_styles.dart';
// import '../../gen/assets.gen.dart';
// import '../../generated/locale_keys.g.dart';
// import 'package:url_launcher/url_launcher.dart';
// import '../../../../../core/constant/values/colors.dart';

// class ContactBottomSheet extends StatelessWidget {
//   const ContactBottomSheet({
//     super.key,
//     required this.phone,
//     required this.message,
//     this.withCall = true,
//     this.withSms = true,
//   });

//   final String phone;
//   final String message;
//   final bool withCall;
//   final bool withSms;

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Padding(
//         padding: EdgeInsets.all(20.sp),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             ListTile(
//               title: Text(
//                 LocaleKeys.whats_app.tr(),
//                 style: TextStyles.semiBold18.copyWith(color: AppColors.black),
//               ),
//               onTap: () async {
//                 final Uri phoneCallURI = Uri.parse(
//                     'whatsapp://send?phone=${phone.replaceFirst('0', '+20')}&text=$message');
//                 if (!await launchUrl(phoneCallURI,
//                     mode: LaunchMode.externalApplication)) {
//                   throw Exception('Could not launch $phoneCallURI');
//                 }
//               },
//               leading: Assets.icons.whatsup.svg(width: 26.sp),
//             ),
//             if (withCall)
//               ListTile(
//                 title: Text(
//                   LocaleKeys.call.tr(),
//                   style: TextStyles.semiBold18.copyWith(color: AppColors.black),
//                 ),
//                 onTap: () async {
//                   final Uri phoneCallURI =
//                       Uri.parse('tel://${phone.replaceFirst('0', '+20')}');
//                   if (!await launchUrl(phoneCallURI,
//                       mode: LaunchMode.externalApplication)) {
//                     throw Exception('Could not launch $phoneCallURI');
//                   }
//                 },
//                 leading: const Icon(
//                   Icons.call,
//                   color: AppColors.primary,
//                 ),
//               ),
//             if (withSms)
//               ListTile(
//                 title: Text(
//                   LocaleKeys.sms.tr(),
//                   style: TextStyles.semiBold18.copyWith(color: AppColors.black),
//                 ),
//                 onTap: () async {
//                   final Uri phoneCallURI = Uri.parse(
//                       'sms:${phone.replaceFirst('0', '+20')}?body=$message');
//                   if (!await launchUrl(phoneCallURI,
//                       mode: LaunchMode.externalApplication)) {
//                     throw Exception('Could not launch $phoneCallURI');
//                   }
//                 },
//                 leading: const Icon(
//                   Icons.sms,
//                   color: AppColors.primary,
//                 ),
//               ),
//             ListTile(
//               title: Text(
//                 LocaleKeys.copy.tr(),
//                 style: TextStyles.semiBold18.copyWith(color: AppColors.black),
//               ),
//               onTap: () async {
//                 Clipboard.setData(
//                   ClipboardData(
//                     text: phone.replaceFirst('0', '+20'),
//                   ),
//                 ).then(
//                   (_) {
//                     Fluttertoast.showToast(msg: LocaleKeys.copied.tr());
//                   },
//                 );
//               },
//               leading: FaIcon(
//                 Icons.copy,
//                 color: AppColors.primary,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
