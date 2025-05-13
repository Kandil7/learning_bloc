import 'package:flutter/material.dart';

/// A widget showcasing Material Design theming in Flutter
///
/// This widget demonstrates:
/// - ColorScheme
/// - Typography
/// - Shape
/// - ThemeData
/// - Dark Mode
class MaterialThemingShowcase extends StatefulWidget {
  /// Creates a new Material theming showcase
  const MaterialThemingShowcase({Key? key}) : super(key: key);

  @override
  State<MaterialThemingShowcase> createState() => _MaterialThemingShowcaseState();
}

class _MaterialThemingShowcaseState extends State<MaterialThemingShowcase> {
  bool _isDarkMode = false;
  Color _primaryColor = Colors.blue;
  double _cornerRadius = 8.0;

  @override
  Widget build(BuildContext context) {
    // Create a custom theme based on the current settings
    final ThemeData customTheme = ThemeData(
      useMaterial3: true,
      brightness: _isDarkMode ? Brightness.dark : Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: _primaryColor,
        brightness: _isDarkMode ? Brightness.dark : Brightness.light,
      ),
      cardTheme: CardTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_cornerRadius),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_cornerRadius),
          ),
        ),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(context, 'Theme Customization'),
        _buildThemeControls(),
        const SizedBox(height: 24),
        
        _buildSectionTitle(context, 'Theme Preview'),
        _buildThemePreview(customTheme),
        const SizedBox(height: 24),
        
        _buildSectionTitle(context, 'Color Scheme'),
        _buildColorSchemeSection(customTheme),
        const SizedBox(height: 24),
        
        _buildSectionTitle(context, 'Typography'),
        _buildTypographySection(customTheme),
        const SizedBox(height: 24),
        
        _buildSectionTitle(context, 'Shape'),
        _buildShapeSection(customTheme),
      ],
    );
  }

  /// Builds a section title
  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  /// Builds the theme controls section
  Widget _buildThemeControls() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Customize the theme to see how it affects the components below.',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text('Dark Mode:'),
                const SizedBox(width: 8),
                Switch(
                  value: _isDarkMode,
                  onChanged: (value) {
                    setState(() {
                      _isDarkMode = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text('Primary Color:'),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildColorOption(Colors.blue),
                _buildColorOption(Colors.red),
                _buildColorOption(Colors.green),
                _buildColorOption(Colors.purple),
                _buildColorOption(Colors.orange),
                _buildColorOption(Colors.teal),
              ],
            ),
            const SizedBox(height: 8),
            const Text('Corner Radius:'),
            Slider(
              value: _cornerRadius,
              min: 0,
              max: 24,
              divisions: 6,
              label: _cornerRadius.round().toString(),
              onChanged: (value) {
                setState(() {
                  _cornerRadius = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  /// Builds a color option button
  Widget _buildColorOption(Color color) {
    return InkWell(
      onTap: () {
        setState(() {
          _primaryColor = color;
        });
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(
            color: _primaryColor == color ? Colors.white : Colors.transparent,
            width: 2,
          ),
          boxShadow: [
            if (_primaryColor == color)
              BoxShadow(
                color: color.withOpacity(0.5),
                blurRadius: 8,
                spreadRadius: 1,
              ),
          ],
        ),
      ),
    );
  }

  /// Builds the theme preview section
  Widget _buildThemePreview(ThemeData theme) {
    return Theme(
      data: theme,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Theme Preview',
                style: theme.textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('ELEVATED'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text('OUTLINED'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      child: const Text('TEXT'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: theme.colorScheme.outline),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: ListTile(
                  leading: Icon(Icons.star, color: theme.colorScheme.primary),
                  title: const Text('List Item'),
                  subtitle: const Text('With custom theme applied'),
                  trailing: Switch(
                    value: true,
                    onChanged: (value) {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the color scheme section
  Widget _buildColorSchemeSection(ThemeData theme) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'ColorScheme defines the color of the UI components in your app.',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildColorSwatch('Primary', theme.colorScheme.primary),
                _buildColorSwatch('Secondary', theme.colorScheme.secondary),
                _buildColorSwatch('Surface', theme.colorScheme.surface),
                _buildColorSwatch('Background', theme.colorScheme.background),
                _buildColorSwatch('Error', theme.colorScheme.error),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Builds a color swatch
  Widget _buildColorSwatch(String label, Color color) {
    final bool isDark = ThemeData.estimateBrightnessForColor(color) == Brightness.dark;
    
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          color: color,
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: isDark ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '#${color.value.toRadixString(16).substring(2).toUpperCase()}',
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  /// Builds the typography section
  Widget _buildTypographySection(ThemeData theme) {
    return Theme(
      data: theme,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Typography defines the text styles in your app.',
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 16),
              Text('Display Large', style: theme.textTheme.displayLarge),
              Text('Display Medium', style: theme.textTheme.displayMedium),
              Text('Display Small', style: theme.textTheme.displaySmall),
              const SizedBox(height: 8),
              Text('Headline Large', style: theme.textTheme.headlineLarge),
              Text('Headline Medium', style: theme.textTheme.headlineMedium),
              Text('Headline Small', style: theme.textTheme.headlineSmall),
              const SizedBox(height: 8),
              Text('Title Large', style: theme.textTheme.titleLarge),
              Text('Title Medium', style: theme.textTheme.titleMedium),
              Text('Title Small', style: theme.textTheme.titleSmall),
              const SizedBox(height: 8),
              Text('Body Large', style: theme.textTheme.bodyLarge),
              Text('Body Medium', style: theme.textTheme.bodyMedium),
              Text('Body Small', style: theme.textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the shape section
  Widget _buildShapeSection(ThemeData theme) {
    return Theme(
      data: theme,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Shape defines the corners of components in your app.',
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const Text('Card Shape'),
                        const SizedBox(height: 8),
                        Card(
                          child: SizedBox(
                            height: 100,
                            child: Center(
                              child: Text(
                                'Radius: ${_cornerRadius.toStringAsFixed(1)}',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      children: [
                        const Text('Button Shape'),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Center(
                              child: Text(
                                'Radius: ${_cornerRadius.toStringAsFixed(1)}',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
