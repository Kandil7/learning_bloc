import 'package:flutter/material.dart';
import 'package:flutter_mastery/bloc_journey/1_basics/bloc_observer/bloc_observer_page.dart';
import 'package:flutter_mastery/bloc_journey/1_basics/bloc_theory.dart';
import 'package:flutter_mastery/bloc_journey/1_basics/counter_bloc/counter_bloc_page.dart';
import 'package:flutter_mastery/bloc_journey/1_basics/counter_cubit/counter_cubit_page.dart';
import 'package:flutter_mastery/bloc_journey/2_intermediate/bloc_communication/bloc_communication_page.dart';
import 'package:flutter_mastery/bloc_journey/2_intermediate/error_handling/error_handling_page.dart';
import 'package:flutter_mastery/bloc_journey/2_intermediate/form_validation/form_validation_page.dart';
import 'package:flutter_mastery/bloc_journey/2_intermediate/navigation/navigation_page.dart';

/// BLoC Learning Journey Dashboard
///
/// This dashboard provides navigation to different sections of the BLoC learning journey,
/// from basic concepts to advanced implementations.
class BlocJourneyDashboard extends StatelessWidget {
  const BlocJourneyDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BLoC Learning Journey'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle(context, '1. Basics'),
            _buildLessonCard(
              context,
              title: 'Introduction to BLoC Pattern',
              description: 'Learn the core concepts of BLoC pattern',
              icon: Icons.school,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BlocTheoryPage()),
                );
              },
            ),
            _buildLessonCard(
              context,
              title: 'Counter with Cubit',
              description: 'Implement a simple counter using Cubit',
              icon: Icons.add_circle,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CounterCubitPage()),
                );
              },
            ),
            _buildLessonCard(
              context,
              title: 'Counter with BLoC',
              description: 'Implement a counter using BLoC with events',
              icon: Icons.sync_alt,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CounterBlocPage()),
                );
              },
            ),
            _buildLessonCard(
              context,
              title: 'BLoC Observer',
              description: 'Debug BLoC state changes with BLoC Observer',
              icon: Icons.visibility,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BlocObserverPage()),
                );
              },
            ),
            const SizedBox(height: 16),
            _buildSectionTitle(context, '2. Intermediate'),
            _buildLessonCard(
              context,
              title: 'Form Validation',
              description: 'Implement form validation using BLoC',
              icon: Icons.check_circle,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FormValidationPage()),
                );
              },
            ),
            _buildLessonCard(
              context,
              title: 'Navigation with BLoC',
              description: 'Manage navigation using BLoC pattern',
              icon: Icons.navigation,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NavigationPage()),
                );
              },
            ),
            _buildLessonCard(
              context,
              title: 'BLoC-to-BLoC Communication',
              description: 'Learn how to communicate between BLoCs',
              icon: Icons.compare_arrows,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BlocCommunicationPage()),
                );
              },
            ),
            _buildLessonCard(
              context,
              title: 'Error Handling',
              description: 'Handle errors and loading states with BLoC',
              icon: Icons.error,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ErrorHandlingPage()),
                );
              },
            ),
            const SizedBox(height: 16),
            _buildSectionTitle(context, '3. Advanced'),
            _buildLessonCard(
              context,
              title: 'Complex State Management',
              description: 'Manage complex state with BLoC pattern',
              icon: Icons.account_tree,
              onTap: () {
                // We'll implement navigation to the lesson page later
              },
            ),
            _buildLessonCard(
              context,
              title: 'BLoC with Clean Architecture',
              description: 'Integrate BLoC with Clean Architecture',
              icon: Icons.architecture,
              onTap: () {
                // We'll implement navigation to the lesson page later
              },
            ),
            _buildLessonCard(
              context,
              title: 'BLoC with Dependency Injection',
              description: 'Use BLoC with Dependency Injection',
              icon: Icons.settings_input_component,
              onTap: () {
                // We'll implement navigation to the lesson page later
              },
            ),
            _buildLessonCard(
              context,
              title: 'Performance Optimization',
              description: 'Optimize BLoC for better performance',
              icon: Icons.speed,
              onTap: () {
                // We'll implement navigation to the lesson page later
              },
            ),
          ],
        ),
      ),
    );
  }

  /// Build a section title widget
  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }

  /// Build a lesson card widget
  Widget _buildLessonCard(
    BuildContext context, {
    required String title,
    required String description,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12.0),
      elevation: 2.0,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(
                icon,
                size: 40.0,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      description,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
    );
  }
}
