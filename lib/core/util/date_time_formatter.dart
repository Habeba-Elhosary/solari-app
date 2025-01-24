// import 'package:intl/intl.dart';
// import '../constant/strings.dart';
// import '../services/get_storage_helper.dart';

// class DateTimeFormatter {
//   // Method to format date (e.g., 05 Nov 2024)
//   static String getFormattedDate(String dateTimeString) {
//     DateTime dateTime =
//         DateTime.parse(dateTimeString); // Parse the string to DateTime
//     return DateFormat('dd MMM yyyy', "en").format(dateTime); // Format the date
//   }

//   // Method to format time (e.g., 02:15)
//   static String getFormattedTime(String dateTimeString) {
//     DateTime dateTime =
//         DateTime.parse(dateTimeString); // Parse the string to DateTime
//     return DateFormat('HH:mm', "en").format(dateTime); // Format the time
//   }

//   static String formatTimeString(String timeString) {
//     try {
//       // Parse the input string to a DateTime object
//       final time = DateFormat('HH:mm')
//           .parse(timeString); // Assuming the input string is in "HH:mm" format
//       final isArabic = CacheHelper.getLocale == ar;

//       // Arabic-specific formatting
//       if (isArabic) {
//         return DateFormat('h:mm a', 'ar')
//             .format(time)
//             .replaceAll('AM', 'صباحاً')
//             .replaceAll('PM', 'مساءً');
//       }

//       // Default (English)
//       return DateFormat('h:mm a', 'en').format(time);
//     } catch (e) {
//       // Handle parsing errors
//       return timeString; // Return the original string if parsing fails
//     }
//   }
// }
