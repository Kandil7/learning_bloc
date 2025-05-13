import 'package:flutter/material.dart';

/// A widget showcasing the box model in Flutter
///
/// This widget demonstrates:
/// - Padding
/// - Margin
/// - Border
/// - BorderRadius
class BoxModelShowcase extends StatelessWidget {
  /// Creates a new box model showcase
  const BoxModelShowcase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(context, 'Padding'),
        _buildPaddingSection(),
        const SizedBox(height: 24),
        
        _buildSectionTitle(context, 'Margin'),
        _buildMarginSection(),
        const SizedBox(height: 24),
        
        _buildSectionTitle(context, 'Border'),
        _buildBorderSection(),
        const SizedBox(height: 24),
        
        _buildSectionTitle(context, 'BorderRadius'),
        _buildBorderRadiusSection(),
        const SizedBox(height: 24),
        
        _buildSectionTitle(context, 'Complete Box Model'),
        _buildCompleteBoxModelSection(),
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

  /// Builds the padding section
  Widget _buildPaddingSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Padding adds empty space around a widget.',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            const Text('Padding.all():'),
            const SizedBox(height: 8),
            Container(
              color: Colors.grey[200],
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 50,
                  color: Colors.blue,
                  child: const Center(
                    child: Text(
                      'Padding: 16 all sides',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Padding.symmetric():'),
            const SizedBox(height: 8),
            Container(
              color: Colors.grey[200],
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 8.0,
                ),
                child: Container(
                  height: 50,
                  color: Colors.green,
                  child: const Center(
                    child: Text(
                      'Padding: 24 horizontal, 8 vertical',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Padding.only():'),
            const SizedBox(height: 8),
            Container(
              color: Colors.grey[200],
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 32.0,
                  top: 16.0,
                ),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.red,
                  child: const Center(
                    child: Text(
                      'Padding: 32 left, 16 top',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the margin section
  Widget _buildMarginSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Margin is implemented using Container\'s margin property.',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            const Text('Container with margin:'),
            const SizedBox(height: 8),
            Container(
              color: Colors.grey[200],
              child: Container(
                margin: const EdgeInsets.all(16.0),
                height: 50,
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    'Margin: 16 all sides',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Container with symmetric margin:'),
            const SizedBox(height: 8),
            Container(
              color: Colors.grey[200],
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 8.0,
                ),
                height: 50,
                color: Colors.green,
                child: const Center(
                  child: Text(
                    'Margin: 24 horizontal, 8 vertical',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Multiple containers with margin:'),
            const SizedBox(height: 8),
            Container(
              color: Colors.grey[200],
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 8.0),
                    height: 30,
                    color: Colors.red,
                    child: const Center(child: Text('Item 1')),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 8.0),
                    height: 30,
                    color: Colors.blue,
                    child: const Center(child: Text('Item 2')),
                  ),
                  Container(
                    height: 30,
                    color: Colors.green,
                    child: const Center(child: Text('Item 3')),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the border section
  Widget _buildBorderSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Borders can be added using Container\'s decoration property.',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            const Text('Solid border:'),
            const SizedBox(height: 8),
            Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue,
                  width: 2.0,
                ),
              ),
              child: const Center(
                child: Text('Solid border: 2px blue'),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Colored sides:'),
            const SizedBox(height: 8),
            Container(
              height: 80,
              width: double.infinity,
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.red, width: 3.0),
                  right: BorderSide(color: Colors.green, width: 3.0),
                  bottom: BorderSide(color: Colors.blue, width: 3.0),
                  left: BorderSide(color: Colors.purple, width: 3.0),
                ),
              ),
              child: const Center(
                child: Text('Different border colors and widths'),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Border with color and background:'),
            const SizedBox(height: 8),
            Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.amber[100],
                border: Border.all(
                  color: Colors.amber[800]!,
                  width: 2.0,
                ),
              ),
              child: Center(
                child: Text(
                  'Background with border',
                  style: TextStyle(color: Colors.amber[800]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the border radius section
  Widget _buildBorderRadiusSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'BorderRadius creates rounded corners.',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            const Text('Circular border radius:'),
            const SizedBox(height: 8),
            Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: const Center(
                child: Text(
                  'BorderRadius.circular(16)',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Different corner radii:'),
            const SizedBox(height: 8),
            Container(
              height: 80,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.0),
                  bottomRight: Radius.circular(24.0),
                ),
              ),
              child: const Center(
                child: Text(
                  'BorderRadius.only(topLeft, bottomRight)',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Border with radius:'),
            const SizedBox(height: 8),
            Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.purple, width: 2.0),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: const Center(
                child: Text('Border with radius'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the complete box model section
  Widget _buildCompleteBoxModelSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'The complete box model combines margin, border, padding, and content.',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            Container(
              color: Colors.grey[200],
              padding: const EdgeInsets.all(16.0),
              child: Container(
                margin: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.blue, width: 3.0),
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Complete Box Model',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'This example shows:',
                        style: TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 4),
                      const Text('• Margin: 16px all around'),
                      const Text('• Border: 3px solid blue'),
                      const Text('• BorderRadius: 8px'),
                      const Text('• Padding: 16px all around'),
                      const Text('• Content: This text'),
                      const Text('• BoxShadow: 10px blur, 5px y-offset'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
