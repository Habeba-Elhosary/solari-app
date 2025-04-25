import 'dart:ui';
import 'package:solari/core/constants/app_colors.dart';

enum PanelStatus {
  healthy,
  poor,
  faulted;

  Color get backgroundColor {
    switch (this) {
      case PanelStatus.healthy:
        return Color(0xFFEBFBEE);
      case PanelStatus.poor:
        return Color(0XFFFFF9DB);
      case PanelStatus.faulted:
        return Color(0xFFFFF5F5);
    }
  }

  Color get textColor {
    switch (this) {
      case PanelStatus.healthy:
        return AppColors.green;
      case PanelStatus.poor:
        return AppColors.orange;
      case PanelStatus.faulted:
        return AppColors.red;
    }
  }

  String get label {
    switch (this) {
      case PanelStatus.healthy:
        return 'Healthy';
      case PanelStatus.poor:
        return 'Poor';
      case PanelStatus.faulted:
        return 'Faulted';
    }
  }
}
