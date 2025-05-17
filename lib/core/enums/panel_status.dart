// ignore_for_file: constant_identifier_names

import 'dart:ui';
import 'package:solari/core/constants/app_colors.dart';

const String HEALTHY = 'Healthy';
const String GOOD = 'Good';
const String POOR = 'Poor';

enum PanelStatus {
  healthy,
  good,
  poor;

  Color get backgroundColor {
    switch (this) {
      case PanelStatus.healthy:
        return Color(0xFFEBFBEE);
      case PanelStatus.good:
        return Color(0XFFFFF9DB);
      case PanelStatus.poor:
        return Color(0xFFFFF5F5);
    }
  }

  Color get textColor {
    switch (this) {
      case PanelStatus.healthy:
        return AppColors.green;
      case PanelStatus.good:
        return AppColors.orange;
      case PanelStatus.poor:
        return AppColors.red;
    }
  }

  String get label {
    switch (this) {
      case PanelStatus.healthy:
        return 'Healthy';
      case PanelStatus.good:
        return 'Good';
      case PanelStatus.poor:
        return 'Poor';
    }
  }

    String getServerString() {
    switch (this) {
      case PanelStatus.healthy:
        return HEALTHY;
      case PanelStatus.good:
        return GOOD;
      case PanelStatus.poor:
        return POOR;
    }
  }

  static PanelStatus fromStringKey(String key) {
    switch (key) {
      case HEALTHY:
        return PanelStatus.healthy;
      case GOOD:
        return PanelStatus.good;
      case POOR:
        return PanelStatus.poor;
      default:
        return PanelStatus.healthy;
    }
  }
}
