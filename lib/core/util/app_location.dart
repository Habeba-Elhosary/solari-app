// import 'package:geocoding/geocoding.dart' as geocoding;
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// abstract class AppLocation {
//   Future<Position?> determinePosition();
//   Future<String> getAddress(LatLng position);
// }

// class AppLocationImpl implements AppLocation {
//   static Position? lastLocation;
//   @override
//   Future<Position?> determinePosition() async {
//     // if (lastLocation != null) {
//     //   return lastLocation!;
//     // }
//     bool serviceEnabled;
//     LocationPermission permission;

//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       permission = await Geolocator.requestPermission();
//     }
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         return null;
//       }
//     }
//     if (permission == LocationPermission.deniedForever) {
//       permission = await Geolocator.requestPermission();
//       return null;
//     }
//     lastLocation = await Geolocator.getCurrentPosition();
//     return lastLocation;
//   }

//   @override
//   Future<String> getAddress(LatLng position) async {
//     final List<geocoding.Placemark> address = await geocoding
//         .placemarkFromCoordinates(position.latitude, position.longitude);
//     if (address.isNotEmpty) {
//       if (address.first.street?.isNotEmpty ?? false) {
//         return address.first.street ??
//             '${position.latitude}, ${position.longitude}';
//       }
//     }
//     return '${position.latitude}, ${position.longitude}';
//   }
// }
