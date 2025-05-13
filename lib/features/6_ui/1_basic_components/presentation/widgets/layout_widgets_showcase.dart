import 'package:flutter/material.dart';

/// A widget showcasing layout widgets in Flutter
///
/// This widget demonstrates:
/// - Container widget
/// - Row and Column widgets
/// - Stack widget
/// - Expanded and Flexible widgets
/// - Wrap widget
class LayoutWidgetsShowcase extends StatelessWidget {
  /// Creates a new layout widgets showcase
  const LayoutWidgetsShowcase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(context, 'Container'),
        _buildContainerSection(),
        const SizedBox(height: 24),
        
        _buildSectionTitle(context, 'Row'),
        _buildRowSection(),
        const SizedBox(height: 24),
        
        _buildSectionTitle(context, 'Column'),
        _buildColumnSection(),
        const SizedBox(height: 24),
        
        _buildSectionTitle(context, 'Stack'),
        _buildStackSection(),
        const SizedBox(height: 24),
        
        _buildSectionTitle(context, 'Expanded and Flexible'),
        _buildExpandedFlexibleSection(),
        const SizedBox(height: 24),
        
        _buildSectionTitle(context, 'Wrap'),
        _buildWrapSection(),
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

  /// Builds a colored box with a label
  Widget _buildColoredBox(Color color, String label) {
    return Container(
      width: 60,
      height: 60,
      color: color,
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  /// Builds the container section
  Widget _buildContainerSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Container is a convenience widget that combines common painting, positioning, and sizing widgets.',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            const Text('Basic Container:'),
            const SizedBox(height: 8),
            Container(
              width: 100,
              height: 100,
              color: Colors.blue,
              child: const Center(
                child: Text(
                  'Basic',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Styled Container:'),
            const SizedBox(height: 8),
            Container(
              width: 120,
              height: 120,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
                gradient: const LinearGradient(
                  colors: [Colors.purple, Colors.deepPurple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Center(
                child: Text(
                  'Styled',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the row section
  Widget _buildRowSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Row arranges its children in a horizontal line.',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            const Text('Basic Row:'),
            const SizedBox(height: 8),
            Row(
              children: [
                _buildColoredBox(Colors.red, 'A'),
                _buildColoredBox(Colors.green, 'B'),
                _buildColoredBox(Colors.blue, 'C'),
              ],
            ),
            const SizedBox(height: 16),
            const Text('Row with MainAxisAlignment:'),
            const SizedBox(height: 8),
            Container(
              color: Colors.grey[200],
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildColoredBox(Colors.red, 'A'),
                  _buildColoredBox(Colors.green, 'B'),
                  _buildColoredBox(Colors.blue, 'C'),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text('Row with CrossAxisAlignment:'),
            const SizedBox(height: 8),
            Container(
              color: Colors.grey[200],
              width: double.infinity,
              height: 100,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _buildColoredBox(Colors.red, 'A'),
                  _buildColoredBox(Colors.green, 'B'),
                  _buildColoredBox(Colors.blue, 'C'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the column section
  Widget _buildColumnSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Column arranges its children in a vertical line.',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            const Text('Basic Column:'),
            const SizedBox(height: 8),
            Column(
              children: [
                _buildColoredBox(Colors.red, 'A'),
                _buildColoredBox(Colors.green, 'B'),
                _buildColoredBox(Colors.blue, 'C'),
              ],
            ),
            const SizedBox(height: 16),
            const Text('Column with MainAxisAlignment:'),
            const SizedBox(height: 8),
            Container(
              color: Colors.grey[200],
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildColoredBox(Colors.red, 'A'),
                  _buildColoredBox(Colors.green, 'B'),
                  _buildColoredBox(Colors.blue, 'C'),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text('Column with CrossAxisAlignment:'),
            const SizedBox(height: 8),
            Container(
              color: Colors.grey[200],
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _buildColoredBox(Colors.red, 'A'),
                  _buildColoredBox(Colors.green, 'B'),
                  _buildColoredBox(Colors.blue, 'C'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the stack section
  Widget _buildStackSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Stack allows children to be positioned on top of each other.',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            const Text('Basic Stack:'),
            const SizedBox(height: 8),
            SizedBox(
              height: 100,
              width: 100,
              child: Stack(
                children: [
                  Container(color: Colors.red),
                  Container(
                    color: Colors.green,
                    width: 70,
                    height: 70,
                  ),
                  Container(
                    color: Colors.blue,
                    width: 40,
                    height: 40,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text('Stack with Positioned:'),
            const SizedBox(height: 8),
            SizedBox(
              height: 150,
              width: double.infinity,
              child: Stack(
                children: [
                  Container(color: Colors.grey[300]),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: _buildColoredBox(Colors.red, 'Top\nLeft'),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: _buildColoredBox(Colors.green, 'Top\nRight'),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: _buildColoredBox(Colors.blue, 'Bottom\nLeft'),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: _buildColoredBox(Colors.purple, 'Bottom\nRight'),
                  ),
                  const Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Text(
                        'Center',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the expanded and flexible section
  Widget _buildExpandedFlexibleSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Expanded and Flexible widgets control how children expand to fill available space.',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            const Text('Row with Expanded:'),
            const SizedBox(height: 8),
            Row(
              children: [
                _buildColoredBox(Colors.red, 'A'),
                Expanded(
                  child: Container(
                    height: 60,
                    color: Colors.green,
                    child: const Center(
                      child: Text(
                        'Expanded',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                _buildColoredBox(Colors.blue, 'C'),
              ],
            ),
            const SizedBox(height: 16),
            const Text('Row with multiple Expanded widgets:'),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 60,
                    color: Colors.red,
                    child: const Center(
                      child: Text(
                        'flex: 1',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 60,
                    color: Colors.green,
                    child: const Center(
                      child: Text(
                        'flex: 2',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 60,
                    color: Colors.blue,
                    child: const Center(
                      child: Text(
                        'flex: 1',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text('Flexible vs Expanded:'),
            const SizedBox(height: 8),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    height: 60,
                    color: Colors.orange,
                    child: const Center(
                      child: Text(
                        'Flexible',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 60,
                    color: Colors.purple,
                    child: const Center(
                      child: Text(
                        'Expanded',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the wrap section
  Widget _buildWrapSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Wrap displays its children in multiple horizontal or vertical runs.',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            const Text('Wrap with spacing:'),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8, // gap between adjacent chips
              runSpacing: 8, // gap between lines
              children: [
                _buildChip('Flutter'),
                _buildChip('Dart'),
                _buildChip('UI'),
                _buildChip('Widgets'),
                _buildChip('Mobile'),
                _buildChip('Web'),
                _buildChip('Desktop'),
                _buildChip('Cross-Platform'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Builds a chip widget for the wrap example
  Widget _buildChip(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.blue[100],
      labelStyle: TextStyle(color: Colors.blue[800]),
    );
  }
}
