import 'package:flutter/material.dart';

/// A page showcasing basic UI components in Flutter
///
/// This page will demonstrate:
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
      body: const Center(
        child: Text(
          'Basic Components Page\n(Coming Soon)',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
