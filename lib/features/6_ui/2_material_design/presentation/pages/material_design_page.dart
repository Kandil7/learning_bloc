import 'package:flutter/material.dart';
import 'package:flutter_mastery/features/6_ui/2_material_design/presentation/widgets/material_components_showcase.dart';
import 'package:flutter_mastery/features/6_ui/2_material_design/presentation/widgets/material_theming_showcase.dart';
import 'package:flutter_mastery/features/6_ui/2_material_design/presentation/widgets/material_navigation_showcase.dart';
import 'package:flutter_mastery/features/6_ui/2_material_design/presentation/widgets/material_form_showcase.dart';

/// A page showcasing Material Design in Flutter
///
/// This page demonstrates:
/// - Material components (AppBar, Card, FloatingActionButton)
/// - Material theming (colors, typography, shapes)
/// - Material design principles
/// - Navigation patterns
/// - Form components
class MaterialDesignPage extends StatelessWidget {
  /// Creates a new Material Design page
  const MaterialDesignPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Material Design'), centerTitle: true),
      body: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            const TabBar(
              tabs: [
                Tab(text: 'Components'),
                Tab(text: 'Theming'),
                Tab(text: 'Navigation'),
                Tab(text: 'Forms'),
              ],
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.blue,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildTabContent(
                    context,
                    title: 'Material Components',
                    description:
                        'Essential Material Design components like AppBar, Cards, Buttons, and more',
                    content: const MaterialComponentsShowcase(),
                  ),
                  _buildTabContent(
                    context,
                    title: 'Material Theming',
                    description:
                        'Customize your app\'s look and feel with Material Theming',
                    content: const MaterialThemingShowcase(),
                  ),
                  _buildTabContent(
                    context,
                    title: 'Material Navigation',
                    description:
                        'Navigation patterns like Bottom Navigation, Tabs, and Drawers',
                    content: const MaterialNavigationShowcase(),
                  ),
                  _buildTabContent(
                    context,
                    title: 'Material Form Components',
                    description:
                        'Form components like TextField, Checkbox, Radio, and more',
                    content: const MaterialFormShowcase(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the content for each tab
  Widget _buildTabContent(
    BuildContext context, {
    required String title,
    required String description,
    required Widget content,
  }) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 8),
          Text(description, style: Theme.of(context).textTheme.bodyMedium),
          const Divider(height: 32),
          content,
        ],
      ),
    );
  }
}
