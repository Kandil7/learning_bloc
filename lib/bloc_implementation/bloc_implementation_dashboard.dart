import 'package:flutter/material.dart';
import 'counter_bloc/counter_page.dart' as bloc;
import 'counter_cubit/counter_page.dart' as cubit;
import 'bloc_observer/bloc_observer_page.dart';
import 'form_validation/pages/login_page.dart';
import 'bloc_communication/pages/bloc_communication_page.dart';
import 'task_management/task_management_app.dart';

/// BLoC Implementation Dashboard
///
/// This dashboard provides navigation to different BLoC implementation examples.
class BlocImplementationDashboard extends StatelessWidget {
  /// Route name for navigation
  static const routeName = '/bloc-implementation';

  /// Creates a new BlocImplementationDashboard instance
  const BlocImplementationDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BLoC Implementation'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'BLoC Pattern Implementation',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'This dashboard provides access to different BLoC implementation examples, '
              'from basic to advanced concepts.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            _buildSectionTitle('Basic Concepts'),
            _buildCard(
              title: 'Counter with Cubit',
              description: 'Simple counter example using Cubit',
              icon: Icons.add_circle,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const cubit.CounterPage()),
              ),
            ),
            _buildCard(
              title: 'Counter with BLoC',
              description: 'Simple counter example using BLoC',
              icon: Icons.sync_alt,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const bloc.CounterPage()),
              ),
            ),
            _buildCard(
              title: 'BLoC Observer',
              description: 'Monitor BLoC and Cubit instances',
              icon: Icons.visibility,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const BlocObserverPage()),
              ),
            ),
            const SizedBox(height: 24),
            _buildSectionTitle('Intermediate Concepts'),
            _buildCard(
              title: 'Form Validation',
              description: 'Form validation using BLoC and Formz',
              icon: Icons.check_circle,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const LoginPage()),
              ),
            ),
            _buildCard(
              title: 'BLoC Communication',
              description: 'BLoC-to-BLoC communication',
              icon: Icons.compare_arrows,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const BlocCommunicationPage()),
              ),
            ),
            const SizedBox(height: 24),
            _buildSectionTitle('Advanced Concepts'),
            _buildCard(
              title: 'Task Management App',
              description: 'Complete task management app using Clean Architecture and BLoC',
              icon: Icons.task_alt,
              onTap: () async {
                await TaskManagementApp.init();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const TaskManagementApp()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required String description,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        leading: Icon(icon, size: 36),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(description),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}
