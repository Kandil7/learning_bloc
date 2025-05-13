import 'package:flutter/material.dart';
import 'package:flutter_mastery/bloc_learning/examples/singleton_pattern_example/theme_manager.dart';

/// ThemeScreen
///
/// This screen demonstrates the Singleton Pattern by showing how a single
/// ThemeManager instance can be accessed and modified from different parts
/// of the application while maintaining its state.
class ThemeScreen extends StatefulWidget {
  const ThemeScreen({Key? key}) : super(key: key);

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  // Get the singleton instance
  final themeManager = ThemeManager();
  
  // Available colors for theme customization
  final List<Color> _availableColors = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.purple,
    Colors.orange,
    Colors.teal,
    Colors.indigo,
    Colors.pink,
  ];

  @override
  Widget build(BuildContext context) {
    return Theme(
      // Use the theme from our singleton
      data: themeManager.currentTheme,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Singleton Pattern - Theme Manager'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(
                themeManager.isDarkMode ? Icons.light_mode : Icons.dark_mode,
              ),
              onPressed: () {
                setState(() {
                  themeManager.toggleTheme();
                });
              },
              tooltip: 'Toggle Theme',
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildExplanation(),
              const SizedBox(height: 24),
              _buildThemeControls(),
              const SizedBox(height: 24),
              _buildThemePreview(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExplanation() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Singleton Pattern',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'This example demonstrates the Singleton Pattern:',
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '• Ensures only one instance of ThemeManager exists',
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
          Text(
            '• Provides global access to that instance',
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
          Text(
            '• Maintains state across the entire application',
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
          Text(
            '• Lazy initialization (created only when needed)',
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildThemeControls() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Theme Controls',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text(
                  'Dark Mode:',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(width: 16),
                Switch(
                  value: themeManager.isDarkMode,
                  onChanged: (value) {
                    setState(() {
                      themeManager.toggleTheme();
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Primary Color:',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _availableColors.map((color) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      themeManager.setPrimaryColor(color);
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor: color,
                    radius: 20,
                    child: themeManager.currentTheme.primaryColor == color
                        ? Icon(
                            Icons.check,
                            color: color.computeLuminance() > 0.5
                                ? Colors.black
                                : Colors.white,
                          )
                        : null,
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  themeManager.resetToDefault();
                });
              },
              icon: const Icon(Icons.refresh),
              label: const Text('RESET TO DEFAULT'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThemePreview() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Theme Preview',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            Text(
              'Text Styles',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text('Headline Large', style: Theme.of(context).textTheme.headlineLarge),
            Text('Headline Medium', style: Theme.of(context).textTheme.headlineMedium),
            Text('Title Large', style: Theme.of(context).textTheme.titleLarge),
            Text('Body Large', style: Theme.of(context).textTheme.bodyLarge),
            Text('Body Medium', style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 16),
            Text(
              'UI Components',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('ELEVATED'),
                ),
                FilledButton(
                  onPressed: () {},
                  child: const Text('FILLED'),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('OUTLINED'),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('TEXT'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              color: Theme.of(context).colorScheme.primary,
              child: Text(
                'Primary Color Container',
                style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(16),
              color: Theme.of(context).colorScheme.secondary,
              child: Text(
                'Secondary Color Container',
                style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}