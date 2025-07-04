// ignore_for_file: constant_identifier_names

const String MANAGER = 'manager';
const String TECHNICIAN = 'technician';
const String CLIENT = 'client';

enum UserType {
  manager,
  technician,
  client;

  String getServerString() {
    switch (this) {
      case UserType.manager:
        return MANAGER;
      case UserType.technician:
        return TECHNICIAN;
      case UserType.client:
        return CLIENT;
    }
  }

  static UserType fromStringKey(String key) {
    switch (key) {
      case MANAGER:
        return UserType.manager;
      case TECHNICIAN:
        return UserType.technician;
      case CLIENT:
        return UserType.client;
      default:
        return UserType.manager;
    }
  }
}
