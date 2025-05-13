import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mastery/features/6_ui/3_cupertino_design/presentation/widgets/cupertino_components_showcase.dart';

/// A page showcasing Cupertino Design in Flutter
///
/// This page demonstrates:
/// - Cupertino components (CupertinoNavigationBar, CupertinoButton)
/// - iOS design patterns
/// - Platform-adaptive design
/// - Cupertino theming
/// - iOS-specific navigation
class CuperinoDesignPage extends StatelessWidget {
  /// Creates a new Cupertino Design page
  const CuperinoDesignPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cupertino Design'),
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
                    'iOS-Style Interfaces',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Learn how to create beautiful iOS-style interfaces using Flutter\'s Cupertino widgets',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            const CupertinoComponentsShowcase(),
          ],
        ),
      ),
    );
  }
}
