// import 'package:easy_localization/easy_localization.dart';

// ignore_for_file: depend_on_referenced_packages

import 'package:intl/intl.dart';

extension CommaSeparated on num {
  String toCommaSeparatedString() {
    final NumberFormat formatter = NumberFormat('#,##0.00', 'en_US');
    return formatter.format(this);
  }
}
