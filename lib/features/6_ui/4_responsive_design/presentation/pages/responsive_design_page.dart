import 'package:flutter/material.dart';
import 'package:flutter_mastery/features/6_ui/4_responsive_design/presentation/widgets/responsive_layout_showcase.dart';

/// A page showcasing responsive design in Flutter
///
/// This page demonstrates:
/// - MediaQuery and LayoutBuilder
/// - Responsive layout patterns
/// - Adaptive widgets
/// - Screen size breakpoints
class ResponsiveDesignPage extends StatelessWidget {
  /// Creates a new responsive design page
  const ResponsiveDesignPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive Design'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Adaptive UI Development',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Learn how to create responsive layouts that adapt to any screen size',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            const ResponsiveLayoutShowcase(),
          ],
        ),
      ),
    );
  }
}
