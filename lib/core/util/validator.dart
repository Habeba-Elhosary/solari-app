// import 'package:easy_localization/easy_localization.dart';
// import '../../generated/locale_keys.g.dart';

// class Validator {
//   static String? defaultValidator(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return LocaleKeys.error_filed_required.tr();
//     }

//     return null;
//   }

//   static String? name(String? value) {
//     if (value != null) {
//       value = value.trim();
//       if (value.isEmpty) {
//         return LocaleKeys.error_filed_required.tr();
//       }
//       if (value.length < 3) {
//         return LocaleKeys.name_short_input.tr();
//       }
//     }
//     return null;
//   }

//   static String? fastOrder(String? value) {
//     if (value != null) {
//       value = value.trim();
//       if (value.isEmpty) {
//         return LocaleKeys.error_filed_required.tr();
//       }
//       if (value.length < 3) {
//         return LocaleKeys.name_short_input.tr();
//       }
//     }
//     return null;
//   }

//   static String? registerAddress(String? value) {
//     if (value != null) {
//       value = value.trim();
//       if (value.isEmpty) {
//         return LocaleKeys.error_filed_required.tr();
//       }
//       if (value.length < 5) {
//         return LocaleKeys.short_address.tr();
//       }
//     }
//     return null;
//   }

//   static String? text(String? value) {
//     if (value != null) {
//       value = value.trim();
//       if (value.isEmpty) {
//         return LocaleKeys.error_filed_required.tr();
//       } else if (!RegExp('[a-zA-Z]').hasMatch(value)) {
//         return LocaleKeys.enter_correct_name.tr();
//       }
//     }
//     return null;
//   }

//   static String? defaultEmptyValidator(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return LocaleKeys.empty_val.tr();
//     }
//     return null; // No error
//   }

//   static String? email(String? value) {
//     if (value != null) {
//       value = value.trim();
//       if (value.isEmpty) {
//         return LocaleKeys.error_filed_required.tr();
//       } else if (!RegExp(
//               r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//           .hasMatch(value)) {
//         return LocaleKeys.error_email_regex.tr();
//       }
//     } else {
//       return LocaleKeys.error_filed_required.tr();
//     }
//     return null;
//   }

//   static String? emailNotRequired(String? value) {
//     if (value != null) {
//       value = value.trim();
//       if (value.isNotEmpty) {
//         if (!RegExp(
//                 r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//             .hasMatch(value)) {
//           return LocaleKeys.error_email_regex.tr();
//         }
//       }
//     }
//     return null;
//   }

//   static String? password(String? value) {
//     if (value != null) {
//       value = value.trim();
//       if (value.isEmpty) {
//         return LocaleKeys.error_filed_required.tr();
//       }
//       if (value.length < 8) {
//         return LocaleKeys.error_password_validation.tr();
//       }
//     }
//     return null;
//   }

//   static String? confirmPassword(String? confirmPassword, String? password) {
//     if (confirmPassword != null) {
//       confirmPassword = confirmPassword.trim();
//       if (confirmPassword.isEmpty) {
//         return LocaleKeys.error_filed_required.tr();
//       } else if (confirmPassword != password) {
//         return LocaleKeys.error_wrong_password_confirm.tr();
//       }
//     } else {
//       return LocaleKeys.error_filed_required.tr();
//     }
//     return null;
//   }

//   static String? numbers(String? value) {
//     if (value != null) {
//       value = value.trim();
//       if (value.isEmpty) {
//         return LocaleKeys.error_filed_required.tr();
//       }
//       if (value.startsWith('+')) {
//         value = value.replaceFirst(r'+', '');
//       }
//       final int? number = int.tryParse(value);
//       if (number == null) {
//         return LocaleKeys.error_wrong_input.tr();
//       }
//     } else {
//       return LocaleKeys.error_filed_required.tr();
//     }
//     return null;
//   }

//   static String? naturalNumbers(String? value) {
//     if (value != null) {
//       value = value.trim();
//       if (value.isEmpty) {
//         return LocaleKeys.error_filed_required.tr();
//       }
//       if (value.startsWith('+')) {
//         value = value.replaceFirst(r'+', '');
//       }
//       final double? number = double.tryParse(value);
//       if (number == null) {
//         return LocaleKeys.error_wrong_input.tr();
//       }
//       if (number < 0) {
//         return LocaleKeys.error_positive_number_required.tr();
//       }
//     } else {
//       return LocaleKeys.error_filed_required.tr();
//     }
//     return null;
//   }

//   static String? positiveNumbers(String? value) {
//     if (value != null) {
//       value = value.trim();
//       if (value.isEmpty) {
//         return LocaleKeys.error_filed_required.tr();
//       }
//       if (value.startsWith('+')) {
//         value = value.replaceFirst(r'+', '');
//       }
//       final double? number = double.tryParse(value);
//       if (number == null) {
//         return LocaleKeys.error_wrong_input.tr();
//       }
//       if (number <= 0) {
//         return LocaleKeys.error_positive_number_required.tr();
//       }
//     } else {
//       return LocaleKeys.error_filed_required.tr();
//     }
//     return null;
//   }

//   static String? phone(
//     String? value,
//   ) {
//     RegExp regExp = RegExp(r'^01[0-2-5]{1}[0-9]{8}$');
//     if (value == null || value.isEmpty) {
//       return LocaleKeys.error_filed_required.tr();
//     }
//     if (!regExp.hasMatch(value)) {
//       return LocaleKeys.invalid_phone.tr();
//     }
//     return null;
//   }
// }
