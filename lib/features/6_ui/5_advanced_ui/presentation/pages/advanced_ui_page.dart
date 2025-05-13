import 'package:flutter/material.dart';
import 'package:flutter_mastery/features/6_ui/5_advanced_ui/presentation/widgets/animations_showcase.dart';
import 'package:flutter_mastery/features/6_ui/5_advanced_ui/presentation/widgets/state_management_showcase.dart';

/// A page showcasing advanced UI techniques in Flutter
///
/// This page demonstrates:
/// - Custom animations
/// - Custom painting
/// - Custom themes and styling
/// - Slivers and scrolling effects
/// - Advanced UI patterns
class AdvancedUIPage extends StatelessWidget {
  /// Creates a new advanced UI page
  const AdvancedUIPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Advanced UI Techniques'),
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
                    'Advanced UI Mastery',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Learn how to create stunning animations and custom UI elements in Flutter',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            const AnimationsShowcase(),
            const StateManagementShowcase(),
          ],
        ),
      ),
    );
  }
}
