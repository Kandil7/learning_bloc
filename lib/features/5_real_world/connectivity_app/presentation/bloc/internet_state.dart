import 'package:equatable/equatable.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

/// Base class for all internet connectivity states
abstract class InternetState extends Equatable {
  const InternetState();
  
  @override
  List<Object> get props => [];
}

/// Initial state when the connectivity status is unknown
class InternetInitial extends InternetState {}

/// State when the device is connected to the internet
class InternetConnected extends InternetState {
  /// The type of connection (WiFi, mobile, etc.)
  final ConnectivityResult connectionType;
  
  /// Create a new InternetConnected state
  const InternetConnected(this.connectionType);
  
  @override
  List<Object> get props => [connectionType];
  
  /// Get a string representation of the connection type
  String get connectionName {
    switch (connectionType) {
      case ConnectivityResult.wifi:
        return 'WiFi';
      case ConnectivityResult.mobile:
        return 'Mobile Data';
      case ConnectivityResult.ethernet:
        return 'Ethernet';
      case ConnectivityResult.bluetooth:
        return 'Bluetooth';
      case ConnectivityResult.vpn:
        return 'VPN';
      case ConnectivityResult.other:
        return 'Other';
      default:
        return 'Unknown';
    }
  }
}

/// State when the device is disconnected from the internet
class InternetDisconnected extends InternetState {}
