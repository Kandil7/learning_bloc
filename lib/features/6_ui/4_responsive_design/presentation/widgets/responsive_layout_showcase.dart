import 'package:flutter/material.dart';

/// A widget that showcases responsive layout techniques in Flutter
///
/// This widget demonstrates:
/// - MediaQuery for screen size detection
/// - LayoutBuilder for responsive layouts
/// - Adaptive layouts based on screen size
/// - Orientation-specific layouts
class ResponsiveLayoutShowcase extends StatelessWidget {
  /// Creates a new responsive layout showcase
  const ResponsiveLayoutShowcase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Responsive Layout Techniques',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          
          // MediaQuery Example
          _buildSectionTitle('MediaQuery Example'),
          _buildMediaQueryExample(context),
          const SizedBox(height: 24),
          
          // LayoutBuilder Example
          _buildSectionTitle('LayoutBuilder Example'),
          _buildLayoutBuilderExample(),
          const SizedBox(height: 24),
          
          // Orientation Example
          _buildSectionTitle('Orientation-Specific Layout'),
          _buildOrientationExample(context),
          const SizedBox(height: 24),
          
          // Adaptive Widget Example
          _buildSectionTitle('Adaptive Widgets'),
          _buildAdaptiveWidgetsExample(context),
        ],
      ),
    );
  }

  /// Builds a section title
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  /// Demonstrates using MediaQuery to get screen information
  Widget _buildMediaQueryExample(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;
    final orientation = MediaQuery.of(context).orientation;
    final brightness = MediaQuery.of(context).platformBrightness;
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Screen Width: ${screenSize.width.toStringAsFixed(1)}'),
            Text('Screen Height: ${screenSize.height.toStringAsFixed(1)}'),
            Text('Safe Area Padding - Top: ${padding.top}, Bottom: ${padding.bottom}'),
            Text('Orientation: $orientation'),
            Text('Brightness: $brightness'),
          ],
        ),
      ),
    );
  }

  /// Demonstrates using LayoutBuilder to create responsive layouts
  Widget _buildLayoutBuilderExample() {
    return SizedBox(
      height: 100,
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Adjust the layout based on available width
          if (constraints.maxWidth > 600) {
            // Wide layout - horizontal arrangement
            return Row(
              children: [
                Expanded(
                  child: _buildColorBox(Colors.red, 'Wide Layout'),
                ),
                Expanded(
                  child: _buildColorBox(Colors.blue, 'Two Columns'),
                ),
              ],
            );
          } else {
            // Narrow layout - just show one box
            return _buildColorBox(
              Colors.purple,
              'Narrow Layout (Width: ${constraints.maxWidth.toStringAsFixed(1)})',
            );
          }
        },
      ),
    );
  }

  /// Helper to build a colored box with text
  Widget _buildColorBox(Color color, String text) {
    return Container(
      color: color,
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  /// Demonstrates orientation-specific layouts
  Widget _buildOrientationExample(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return Container(
          height: 100,
          color: orientation == Orientation.portrait
              ? Colors.green
              : Colors.orange,
          alignment: Alignment.center,
          child: Text(
            orientation == Orientation.portrait
                ? 'Portrait Mode'
                : 'Landscape Mode',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
  }

  /// Demonstrates adaptive widgets based on screen size
  Widget _buildAdaptiveWidgetsExample(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isSmallScreen ? 'Small Screen UI' : 'Large Screen UI',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            if (isSmallScreen)
              // Compact UI for small screens
              Column(
                children: [
                  _buildListItem('Item 1'),
                  _buildListItem('Item 2'),
                  _buildListItem('Item 3'),
                ],
              )
            else
              // Expanded UI for larger screens
              Row(
                children: [
                  Expanded(child: _buildListItem('Item 1')),
                  Expanded(child: _buildListItem('Item 2')),
                  Expanded(child: _buildListItem('Item 3')),
                ],
              ),
          ],
        ),
      ),
    );
  }

  /// Helper to build a list item
  Widget _buildListItem(String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(text),
    );
  }
}