import 'package:flutter/material.dart';
import 'package:flutter_mastery/features/6_ui/1_basic_components/presentation/pages/basic_components_page.dart';
import 'package:flutter_mastery/features/6_ui/2_material_design/presentation/pages/material_design_page.dart';
import 'package:flutter_mastery/features/6_ui/3_cupertino_design/presentation/pages/cupertino_design_page.dart';
import 'package:flutter_mastery/features/6_ui/4_responsive_design/presentation/pages/responsive_design_page.dart';
import 'package:flutter_mastery/features/6_ui/5_advanced_ui/presentation/pages/advanced_ui_page.dart';

/// Dashboard for the UI section
///
/// This dashboard provides navigation to different UI topics:
/// - Basic UI Components
/// - Material Design
/// - Cupertino Design
/// - Responsive Design
/// - Advanced UI Techniques
class UIDashboard extends StatelessWidget {
  /// Creates a new UI dashboard
  const UIDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Components'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            const SizedBox(height: 24),
            _buildTopicCard(
              context,
              title: 'Basic UI Components',
              description: 'Learn about fundamental Flutter widgets and layouts',
              icon: Icons.widgets,
              onTap: () {
                Navigator.push(
                  context,
                  _createAnimatedRoute(const BasicComponentsPage()),
                );
              },
            ),
            _buildTopicCard(
              context,
              title: 'Material Design',
              description: 'Implement Google\'s Material Design in Flutter',
              icon: Icons.design_services,
              onTap: () {
                Navigator.push(
                  context,
                  _createAnimatedRoute(const MaterialDesignPage()),
                );
              },
            ),
            _buildTopicCard(
              context,
              title: 'Cupertino Design',
              description: 'Create iOS-style interfaces with Cupertino widgets',
              icon: Icons.phone_iphone,
              onTap: () {
                Navigator.push(
                  context,
                  _createAnimatedRoute(const CuperinoDesignPage()),
                );
              },
            ),
            _buildTopicCard(
              context,
              title: 'Responsive Design',
              description: 'Build adaptive UIs that work on any screen size',
              icon: Icons.devices,
              onTap: () {
                Navigator.push(
                  context,
                  _createAnimatedRoute(const ResponsiveDesignPage()),
                );
              },
            ),
            _buildTopicCard(
              context,
              title: 'Advanced UI Techniques',
              description: 'Master custom animations, painters, and styling',
              icon: Icons.auto_awesome,
              onTap: () {
                Navigator.push(
                  context,
                  _createAnimatedRoute(const AdvancedUIPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  /// Shows a dialog indicating that the feature is coming soon
  void _showComingSoonDialog(BuildContext context, String feature) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('$feature Coming Soon'),
        content: Text(
          'The $feature section is currently under development. '
          'Check back later for updates!',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  /// Builds the header section with title and description
  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Flutter UI Mastery',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          'Learn how to create beautiful, responsive, and platform-adaptive user interfaces with Flutter',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }

  /// Creates an animated page route transition
  PageRouteBuilder _createAnimatedRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(position: offsetAnimation, child: child);
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }

  /// Builds a card for each UI topic
  Widget _buildTopicCard(
    BuildContext context, {
    required String title,
    required String description,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  color: Theme.of(context).colorScheme.primary,
                  size: 32,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 16),
            ],
          ),
        ),
      ),
    );
  }
}
