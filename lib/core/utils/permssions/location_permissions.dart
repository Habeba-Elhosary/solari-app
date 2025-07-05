import 'dart:developer';
import 'package:geolocator/geolocator.dart';

class LocationHandler {
  static Future<bool> _checkLocationPermission() async {
    try {
      if (!await Geolocator.isLocationServiceEnabled()) {
        return false;
      }
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      return permission != LocationPermission.denied &&
          permission != LocationPermission.deniedForever;
    } catch (e) {
      log('Error checking location permission: $e');
      return false;
    }
  }

  static Future<Position?> getCurrentPosition() async {
    try {
      if (!await _checkLocationPermission()) return null;
      return await Geolocator.getCurrentPosition();
    } catch (e) {
      log('Error getting current position: $e');
      return null;
    }
  }

  static Future<bool> isFakeLocation(Position position) async {
    try {
      bool isMockLocation = position.isMocked;
      return isMockLocation;
    } catch (e) {
      log('Error checking fake location: $e');
      return false;
    }
  }
}
