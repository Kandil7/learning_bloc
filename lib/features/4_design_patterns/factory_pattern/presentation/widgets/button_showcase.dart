import 'package:flutter/material.dart';
import '../../domain/button.dart';
import '../../domain/button_factory.dart';

/// Widget to showcase different button implementations
///
/// This widget displays different button implementations
/// created by the ButtonFactory.
class ButtonShowcase extends StatelessWidget {
  /// Create a new button showcase widget
  const ButtonShowcase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the current platform
    final platform = Theme.of(context).platform;
    
    // Create buttons using the factory
    final platformButton = ButtonFactory.createButton(
      platform: platform,
      text: 'Platform Button',
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Platform button pressed (${platform.toString().split('.').last})'),
            duration: const Duration(seconds: 1),
          ),
        );
      },
    );
    
    final materialButton = ButtonFactory.createMaterialButton(
      text: 'Material Button',
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Material button pressed'),
            duration: Duration(seconds: 1),
          ),
        );
      },
    );
    
    final cupertinoButton = ButtonFactory.createCupertinoButton(
      text: 'Cupertino Button',
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Cupertino button pressed'),
            duration: Duration(seconds: 1),
          ),
        );
      },
    );
    
    return Column(
      children: [
        _buildButtonSection(
          context,
          title: 'Platform-Specific Button',
          description: 'This button adapts to the current platform (${platform.toString().split('.').last})',
          button: platformButton,
        ),
        const SizedBox(height: 24),
        _buildButtonSection(
          context,
          title: 'Material Design Button',
          description: 'This button uses Material Design regardless of platform',
          button: materialButton,
        ),
        const SizedBox(height: 24),
        _buildButtonSection(
          context,
          title: 'Cupertino (iOS) Button',
          description: 'This button uses Cupertino design regardless of platform',
          button: cupertinoButton,
        ),
      ],
    );
  }
  
  /// Build a section for a button
  Widget _buildButtonSection(
    BuildContext context, {
    required String title,
    required String description,
    required Button button,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          description,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 8),
        Center(
          child: button.build(context),
        ),
        const SizedBox(height: 4),
        Center(
          child: Text(
            'Implementation: ${button.name}',
            style: const TextStyle(
              fontSize: 12,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ],
    );
  }
}
