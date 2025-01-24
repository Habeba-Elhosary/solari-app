import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'check_internet_state.dart';

class InternetConnectionCubit extends Cubit<InternetConnectionState> {
  InternetConnectionCubit() : super(InternetInitialState()) {
    _monitorConnectivity();
  }

  static InternetConnectionCubit get(context) => BlocProvider.of(context);
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? _connectivitySubscription;
  void _monitorConnectivity() {
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
      (List<ConnectivityResult> result) {
        if (result.contains(ConnectivityResult.mobile)) {
          emit(InternetGainedState());
          // Mobile network available.
        } else if (result.contains(ConnectivityResult.wifi)) {
          emit(InternetGainedState());
          // Wi-fi is available.
          // Note for Android:
          // When both mobile and Wi-Fi are turned on system will return Wi-Fi only as active network type
        } else if (result.contains(ConnectivityResult.ethernet)) {
          emit(InternetGainedState());
          // Ethernet connection available.
        } else if (result.contains(ConnectivityResult.vpn)) {
          emit(InternetGainedState());
          // Vpn connection active.
          // Note for iOS and macOS:
          // There is no separate network interface type for [vpn].
          // It returns [other] on any device (also simulator)
        } else if (result.contains(ConnectivityResult.bluetooth)) {
          emit(InternetGainedState());
          // Bluetooth connection available.
        } else if (result.contains(ConnectivityResult.other)) {
          emit(InternetGainedState());
          // Connected to a network which is not in the above mentioned networks.
        } else if (result.contains(ConnectivityResult.none)) {
          emit(InternetLostState());
          // No available network types
        }
      },
    );
  }

  @override
  Future<void> close() {
    _connectivitySubscription?.cancel();
    return super.close();
  }
}
