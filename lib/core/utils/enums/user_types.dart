// ignore_for_file: constant_identifier_names

const String CLIENT = 'client';
const String TECHNICIAN = 'technician';
const String MANAGER = 'manager';

enum UserType {
  client,
  technician,
  manager;

  String getServerString() {
    switch (this) {
      case UserType.client:
        return CLIENT;
      case UserType.technician:
        return TECHNICIAN;
      case UserType.manager:
        return MANAGER;
    }
  }

  static UserType fromStringKey(String key) {
    switch (key) {
      case CLIENT:
        return UserType.client;
      case TECHNICIAN:
        return UserType.technician;
      case MANAGER:
        return UserType.manager;
      default:
        return UserType.technician;
    }
  }
}
