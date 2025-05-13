import 'package:flutter/material.dart';
import 'package:flutter_mastery/bloc_journey/bloc_journey_dashboard.dart';
import 'package:flutter_mastery/bloc_implementation/bloc_implementation_dashboard.dart';
import 'package:flutter_mastery/features/1_fundamentals/counter_app/presentation/pages/counter_page.dart';
import 'package:flutter_mastery/features/2_state_management/bloc_basics/presentation/pages/bloc_basics_page.dart';
import 'package:flutter_mastery/features/2_state_management/form_validation/presentation/pages/form_validation_page.dart';
import 'package:flutter_mastery/features/3_architecture/clean_architecture/presentation/pages/clean_architecture_page.dart';
import 'package:flutter_mastery/features/4_design_patterns/factory_pattern/presentation/pages/factory_pattern_page.dart';
import 'package:flutter_mastery/features/4_design_patterns/observer_pattern/presentation/pages/observer_pattern_page.dart';
import 'package:flutter_mastery/features/5_real_world/connectivity_app/presentation/pages/connectivity_page.dart';
import 'package:flutter_mastery/features/5_real_world/posts_app/presentation/pages/posts_page.dart';
import 'package:flutter_mastery/features/5_real_world/todos_app/presentation/pages/todos_page.dart';
import 'package:flutter_mastery/features/dashboard/presentation/widgets/feature_card.dart';

/// Dashboard page for the FlutterMastery application
///
/// This page serves as the main navigation hub for the application.
/// It displays cards for each learning module, organized by difficulty level.
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Mastery'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFeatureCard(
              context,
              title: 'BLoC Learning Journey',
              description: 'Step-by-step guide to mastering BLoC pattern',
              icon: Icons.school,
              onTap:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BlocJourneyDashboard(),
                    ),
                  ),
            ),
            _buildFeatureCard(
              context,
              title: 'BLoC Implementation',
              description:
                  'Comprehensive implementation of BLoC pattern concepts',
              icon: Icons.code,
              onTap:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BlocImplementationDashboard(),
                    ),
                  ),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle(context, '1. Fundamentals'),
            _buildFeatureCard(
              context,
              title: 'Counter App',
              description: 'Learn the basics of Flutter and state management',
              icon: Icons.add_circle,
              onTap:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CounterPage(),
                    ),
                  ),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle(context, '2. State Management'),
            _buildFeatureCard(
              context,
              title: 'BLoC Basics',
              description: 'Introduction to the BLoC pattern',
              icon: Icons.sync_alt,
              onTap:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BlocBasicsPage(),
                    ),
                  ),
            ),
            _buildFeatureCard(
              context,
              title: 'Form Validation',
              description: 'Implement form validation using BLoC pattern',
              icon: Icons.check_circle,
              onTap:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FormValidationPage(),
                    ),
                  ),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle(context, '3. Architecture'),
            _buildFeatureCard(
              context,
              title: 'Clean Architecture',
              description:
                  'Learn how to implement Clean Architecture in Flutter',
              icon: Icons.architecture,
              onTap:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CleanArchitecturePage(),
                    ),
                  ),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle(context, '4. Design Patterns'),
            _buildFeatureCard(
              context,
              title: 'Factory Pattern',
              description:
                  'Learn how to implement the Factory Pattern in Flutter',
              icon: Icons.widgets,
              onTap:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FactoryPatternPage(),
                    ),
                  ),
            ),
            _buildFeatureCard(
              context,
              title: 'Observer Pattern',
              description:
                  'Learn how to implement the Observer Pattern in Flutter',
              icon: Icons.visibility,
              onTap:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ObserverPatternPage(),
                    ),
                  ),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle(context, '5. Real-World Applications'),
            _buildFeatureCard(
              context,
              title: 'Posts App',
              description: 'Fetch and display posts from a REST API',
              icon: Icons.article,
              onTap:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PostsPage()),
                  ),
            ),
            _buildFeatureCard(
              context,
              title: 'Todos App',
              description: 'Manage a todo list with BLoC pattern',
              icon: Icons.check_box,
              onTap:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TodosPage()),
                  ),
            ),
            _buildFeatureCard(
              context,
              title: 'Connectivity App',
              description: 'Monitor network connectivity with BLoC',
              icon: Icons.wifi,
              onTap:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ConnectivityPage(),
                    ),
                  ),
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
      child: Text(title, style: Theme.of(context).textTheme.headlineMedium),
    );
  }

  /// Build a feature card widget
  Widget _buildFeatureCard(
    BuildContext context, {
    required String title,
    required String description,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return FeatureCard(
      title: title,
      description: description,
      icon: icon,
      onTap: onTap,
    );
  }
}
