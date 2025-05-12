import 'package:flutter/material.dart';
import '../widgets/button_showcase.dart';
import '../widgets/factory_explanation.dart';

/// Page for demonstrating the Factory Pattern
///
/// This page demonstrates the Factory Pattern with a button example.
class FactoryPatternPage extends StatelessWidget {
  /// Create a new Factory Pattern page
  const FactoryPatternPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Factory Pattern'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Factory Pattern Example',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'This example demonstrates the Factory Pattern by creating platform-specific UI components.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            ButtonShowcase(),
            SizedBox(height: 24),
            FactoryExplanation(),
          ],
        ),
      ),
    );
  }
}
