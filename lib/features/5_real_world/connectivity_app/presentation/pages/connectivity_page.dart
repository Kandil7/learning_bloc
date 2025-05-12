import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/internet_cubit.dart';
import '../bloc/internet_state.dart';
import '../widgets/connectivity_status.dart';

/// Page for demonstrating internet connectivity monitoring
class ConnectivityPage extends StatelessWidget {
  /// Create a new connectivity page
  const ConnectivityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connectivity Monitor'),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => InternetCubit()..checkInternetConnection(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildExplanation(),
              const SizedBox(height: 32),
              const Expanded(child: ConnectivityStatus()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExplanation() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue[200]!),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Connectivity Monitoring with Cubit',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 8),
          Text(
            'This example demonstrates how to monitor network connectivity using Cubit:',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 4),
          Text('• Uses connectivity_plus package to monitor network status', style: TextStyle(fontSize: 14)),
          Text('• Implements a Cubit to manage connectivity state', style: TextStyle(fontSize: 14)),
          Text('• Listens to connectivity changes with StreamSubscription', style: TextStyle(fontSize: 14)),
          Text('• Updates UI based on connection status', style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
