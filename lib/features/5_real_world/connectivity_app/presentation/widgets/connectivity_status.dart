import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/internet_cubit.dart';
import '../bloc/internet_state.dart';

/// Widget to display the current connectivity status
class ConnectivityStatus extends StatelessWidget {
  /// Create a new connectivity status widget
  const ConnectivityStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<InternetCubit, InternetState>(
        builder: (context, state) {
          if (state is InternetConnected) {
            return _buildConnectedStatus(context, state);
          } else if (state is InternetDisconnected) {
            return _buildDisconnectedStatus(context);
          } else {
            return _buildCheckingStatus(context);
          }
        },
      ),
    );
  }

  Widget _buildConnectedStatus(BuildContext context, InternetConnected state) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          _getConnectionIcon(state.connectionType),
          size: 100,
          color: Colors.green,
        ),
        const SizedBox(height: 24),
        Text(
          'Connected',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Connection Type: ${state.connectionName}',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 24),
        const Text(
          'Your device is connected to the internet. You can access online features.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildDisconnectedStatus(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.signal_wifi_off, size: 100, color: Colors.red),
        const SizedBox(height: 24),
        Text(
          'Disconnected',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'Your device is not connected to the internet. Please check your connection settings.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: () {
            context.read<InternetCubit>().checkInternetConnection();
          },
          child: const Text('Check Connection'),
        ),
      ],
    );
  }

  Widget _buildCheckingStatus(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircularProgressIndicator(),
        const SizedBox(height: 24),
        Text(
          'Checking Connection...',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }

  IconData _getConnectionIcon(ConnectivityResult connectionType) {
    switch (connectionType) {
      case ConnectivityResult.wifi:
        return Icons.wifi;
      case ConnectivityResult.mobile:
        return Icons.signal_cellular_alt;
      case ConnectivityResult.ethernet:
        return Icons.lan;
      case ConnectivityResult.bluetooth:
        return Icons.bluetooth;
      case ConnectivityResult.vpn:
        return Icons.vpn_key;
      default:
        return Icons.network_check;
    }
  }
}
