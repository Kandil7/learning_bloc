import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'internet_state.dart';

/// Cubit for monitoring internet connectivity
///
/// This cubit uses the connectivity_plus package to monitor the device's
/// internet connection status and emits states accordingly.
class InternetCubit extends Cubit<InternetState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult>? _connectivitySubscription;
  
  /// Create a new InternetCubit
  InternetCubit() : super(InternetInitial()) {
    // Initialize the connectivity subscription
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }
  
  /// Check the current internet connection status
  Future<void> checkInternetConnection() async {
    final connectivityResult = await _connectivity.checkConnectivity();
    _updateConnectionStatus(connectivityResult);
  }
  
  /// Update the connection status based on the connectivity result
  void _updateConnectionStatus(ConnectivityResult result) {
    if (result == ConnectivityResult.none) {
      emit(InternetDisconnected());
    } else {
      emit(InternetConnected(result));
    }
  }
  
  @override
  Future<void> close() {
    _connectivitySubscription?.cancel();
    return super.close();
  }
}
