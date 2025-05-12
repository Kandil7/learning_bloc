import 'package:connectivity_plus/connectivity_plus.dart';

/// Network information
///
/// This abstract class defines the contract for checking network connectivity.
abstract class NetworkInfo {
  /// Check if the device is connected to the internet
  Future<bool> get isConnected;
}

/// Implementation of the network information
class NetworkInfoImpl implements NetworkInfo {
  /// The connectivity service
  final Connectivity connectivity;
  
  /// Create a new network information implementation
  NetworkInfoImpl({required this.connectivity});
  
  @override
  Future<bool> get isConnected async {
    final connectivityResult = await connectivity.checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }
}
