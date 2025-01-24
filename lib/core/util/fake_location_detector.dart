// import 'dart:async';

// import 'package:geolocator/geolocator.dart';

// import 'app_location.dart';

// class FakeLocationDetector {
//   static StreamController<bool> controller = StreamController<bool>.broadcast();

//   static Stream<bool> get stream => controller.stream;

//   static void close() {
//     timer?.cancel();
//     controller.close();
//   }

//   static StreamSubscription? timer;
//   static void open() {
//     // timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
//     timer = Geolocator.getPositionStream().listen((Position value) {
//       AppLocationImpl.lastLocation = value;
//       controller.sink.add(value.isMocked);
//       // TODO: Uncomment this when testing on real device
//       // if (value.isMocked) {
//       //   appNavigator.popToFrist();
//       // }
//     });
//   }
//   // );
//   // }
// }
