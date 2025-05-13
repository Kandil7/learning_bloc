import 'package:flutter/material.dart';
import 'package:flutter_mastery/features/6_ui/1_basic_components/presentation/widgets/basic_widgets_showcase.dart';
import 'package:flutter_mastery/features/6_ui/1_basic_components/presentation/widgets/layout_widgets_showcase.dart';
import 'package:flutter_mastery/features/6_ui/1_basic_components/presentation/widgets/constraints_showcase.dart';
import 'package:flutter_mastery/features/6_ui/1_basic_components/presentation/widgets/box_model_showcase.dart';

/// A page showcasing basic UI components in Flutter
///
/// This page demonstrates:
/// - Basic widgets (Text, Image, Icon, Button)
/// - Layout widgets (Container, Row, Column, Stack)
/// - Constraints and sizing
/// - Box model and padding
class BasicComponentsPage extends StatelessWidget {
  /// Creates a new basic components page
  const BasicComponentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic UI Components'),
        centerTitle: true,
      ),
      body: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            const TabBar(
              tabs: [
                Tab(text: 'Basic Widgets'),
                Tab(text: 'Layout'),
                Tab(text: 'Constraints'),
                Tab(text: 'Box Model'),
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
                    title: 'Basic Widgets',
                    description:
                        'Fundamental widgets like Text, Image, Icon, and Buttons',
                    content: const BasicWidgetsShowcase(),
                  ),
                  _buildTabContent(
                    context,
                    title: 'Layout Widgets',
                    description:
                        'Widgets for arranging other widgets like Row, Column, and Stack',
                    content: const LayoutWidgetsShowcase(),
                  ),
                  _buildTabContent(
                    context,
                    title: 'Constraints and Sizing',
                    description:
                        'Understanding how constraints affect widget sizing',
                    content: const ConstraintsShowcase(),
                  ),
                  _buildTabContent(
                    context,
                    title: 'Box Model',
                    description: 'Working with padding, margin, and borders',
                    content: const BoxModelShowcase(),
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
