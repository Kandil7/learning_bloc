import 'package:flutter/material.dart';

/// A widget showcasing constraints in Flutter
///
/// This widget demonstrates:
/// - BoxConstraints
/// - SizedBox
/// - ConstrainedBox
/// - UnconstrainedBox
/// - AspectRatio
class ConstraintsShowcase extends StatelessWidget {
  /// Creates a new constraints showcase
  const ConstraintsShowcase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(context, 'BoxConstraints'),
        _buildBoxConstraintsSection(),
        const SizedBox(height: 24),

        _buildSectionTitle(context, 'SizedBox'),
        _buildSizedBoxSection(),
        const SizedBox(height: 24),

        _buildSectionTitle(context, 'ConstrainedBox'),
        _buildConstrainedBoxSection(),
        const SizedBox(height: 24),

        _buildSectionTitle(context, 'UnconstrainedBox'),
        _buildUnconstrainedBoxSection(),
        const SizedBox(height: 24),

        _buildSectionTitle(context, 'AspectRatio'),
        _buildAspectRatioSection(),
      ],
    );
  }

  /// Builds a section title
  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: Theme.of(
          context,
        ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  /// Builds the BoxConstraints section
  Widget _buildBoxConstraintsSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'BoxConstraints define the minimum and maximum width and height for a widget.',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            const Text('BoxConstraints.tight():'),
            const SizedBox(height: 8),
            Container(
              color: Colors.grey[200],
              child: Container(
                constraints: BoxConstraints.tight(Size(150, 100)),
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    'Fixed Size\n150x100',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text('BoxConstraints with min/max:'),
            const SizedBox(height: 8),
            Container(
              color: Colors.grey[200],
              width: double.infinity,
              child: Container(
                constraints: const BoxConstraints(
                  minWidth: 100,
                  maxWidth: 200,
                  minHeight: 50,
                  maxHeight: 100,
                ),
                color: Colors.green,
                child: const Center(
                  child: Text(
                    'Min: 100x50\nMax: 200x100',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text('BoxConstraints.expand():'),
            const SizedBox(height: 8),
            Container(
              color: Colors.grey[200],
              height: 100,
              child: Container(
                constraints: const BoxConstraints.expand(height: 50),
                color: Colors.red,
                child: const Center(
                  child: Text(
                    'Expands to fill parent width\nFixed height: 50',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the SizedBox section
  Widget _buildSizedBoxSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'SizedBox is a box with a specified size. It forces its child to have a specific width and/or height.',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            const Text('SizedBox with fixed dimensions:'),
            const SizedBox(height: 8),
            Container(
              color: Colors.grey[200],
              child: SizedBox(
                width: 150,
                height: 100,
                child: Container(
                  color: Colors.blue,
                  child: const Center(
                    child: Text(
                      'SizedBox\n150x100',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text('SizedBox.expand():'),
            const SizedBox(height: 8),
            Container(
              color: Colors.grey[200],
              height: 100,
              child: SizedBox.expand(
                child: Container(
                  color: Colors.green,
                  child: const Center(
                    child: Text(
                      'SizedBox.expand()\nFills parent',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text('SizedBox as a spacer:'),
            const SizedBox(height: 8),
            Container(
              color: Colors.grey[200],
              child: Column(
                children: [
                  Container(
                    height: 30,
                    color: Colors.red,
                    child: const Center(child: Text('Item 1')),
                  ),
                  const SizedBox(height: 20), // Spacer
                  Container(
                    height: 30,
                    color: Colors.blue,
                    child: const Center(child: Text('Item 2')),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the ConstrainedBox section
  Widget _buildConstrainedBoxSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'ConstrainedBox imposes additional constraints on its child.',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            const Text('ConstrainedBox with minimum size:'),
            const SizedBox(height: 8),
            Container(
              color: Colors.grey[200],
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: 200,
                  minHeight: 100,
                ),
                child: Container(
                  color: Colors.purple,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'This container has a minimum size of 200x100',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text('ConstrainedBox with maximum size:'),
            const SizedBox(height: 8),
            Container(
              color: Colors.grey[200],
              width: double.infinity,
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 200,
                  maxHeight: 100,
                ),
                child: Container(
                  width: 300, // This will be constrained to 200
                  height: 150, // This will be constrained to 100
                  color: Colors.orange,
                  child: const Center(
                    child: Text(
                      'Max: 200x100\nRequested: 300x150',
                      textAlign: TextAlign.center,
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

  /// Builds the UnconstrainedBox section
  Widget _buildUnconstrainedBoxSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'UnconstrainedBox allows its child to have its natural or intrinsic size, regardless of the parent\'s constraints.',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            const Text('UnconstrainedBox example:'),
            const SizedBox(height: 8),
            Container(
              color: Colors.grey[200],
              width: double.infinity,
              height: 100,
              child: Center(
                child: UnconstrainedBox(
                  child: Container(
                    width: 150,
                    height: 50,
                    color: Colors.teal,
                    child: const Center(
                      child: Text(
                        'Natural Size: 150x50',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Comparison with and without UnconstrainedBox:'),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const Text('With Constraints:'),
                      const SizedBox(height: 8),
                      Container(
                        color: Colors.grey[200],
                        height: 100,
                        child: Container(
                          color: Colors.red,
                          child: const Center(
                            child: Text(
                              'Fills parent',
                              style: TextStyle(color: Colors.white),
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
                      const Text('Unconstrained:'),
                      const SizedBox(height: 8),
                      Container(
                        color: Colors.grey[200],
                        height: 100,
                        child: Center(
                          child: UnconstrainedBox(
                            child: Container(
                              width: 80,
                              height: 40,
                              color: Colors.red,
                              child: const Center(
                                child: Text(
                                  '80x40',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
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
    );
  }

  /// Builds the AspectRatio section
  Widget _buildAspectRatioSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'AspectRatio attempts to size the child to a specific aspect ratio.',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            const Text('AspectRatio 16:9 (widescreen):'),
            const SizedBox(height: 8),
            Container(
              color: Colors.grey[200],
              width: double.infinity,
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  color: Colors.blue,
                  child: const Center(
                    child: Text(
                      'AspectRatio: 16:9',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text('AspectRatio 1:1 (square):'),
            const SizedBox(height: 8),
            Container(
              color: Colors.grey[200],
              width: double.infinity,
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  color: Colors.green,
                  child: const Center(
                    child: Text(
                      'AspectRatio: 1:1',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text('AspectRatio 4:3:'),
            const SizedBox(height: 8),
            Container(
              color: Colors.grey[200],
              width: double.infinity,
              child: AspectRatio(
                aspectRatio: 4 / 3,
                child: Container(
                  color: Colors.purple,
                  child: const Center(
                    child: Text(
                      'AspectRatio: 4:3',
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
}
