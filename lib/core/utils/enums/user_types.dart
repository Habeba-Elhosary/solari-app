// ignore_for_file: constant_identifier_names

const String FOLLOW_UP = 'follow_up';
const String TECHNICIAN = 'technician';
const String MANAGER = 'manager';

enum UserType {
  folllowUp,
  technician,
  manager;

  String getServerString() {
    switch (this) {
      case UserType.folllowUp:
        return FOLLOW_UP;
      case UserType.technician:
        return TECHNICIAN;
      case UserType.manager:
        return MANAGER;
    }
  }

  static UserType fromStringKey(String key) {
    switch (key) {
      case FOLLOW_UP:
        return UserType.folllowUp;
      case TECHNICIAN:
        return UserType.technician;
      case MANAGER:
        return UserType.manager;
      default:
        return UserType.folllowUp;
    }
  }
}
