import 'package:flutter/material.dart';

/// A widget showcasing basic Flutter widgets
///
/// This widget demonstrates:
/// - Text widgets with different styles
/// - Image widgets from various sources
/// - Icon widgets
/// - Button widgets (ElevatedButton, TextButton, OutlinedButton)
/// - TextField widgets
class BasicWidgetsShowcase extends StatelessWidget {
  /// Creates a new basic widgets showcase
  const BasicWidgetsShowcase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(context, 'Text Widgets'),
        _buildTextWidgetsSection(),
        const SizedBox(height: 24),
        
        _buildSectionTitle(context, 'Image Widgets'),
        _buildImageWidgetsSection(),
        const SizedBox(height: 24),
        
        _buildSectionTitle(context, 'Icon Widgets'),
        _buildIconWidgetsSection(),
        const SizedBox(height: 24),
        
        _buildSectionTitle(context, 'Button Widgets'),
        _buildButtonWidgetsSection(),
        const SizedBox(height: 24),
        
        _buildSectionTitle(context, 'TextField Widgets'),
        _buildTextFieldWidgetsSection(),
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

  /// Builds the text widgets section
  Widget _buildTextWidgetsSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Default Text',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Styled Text',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue[700],
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'This is a longer text that will wrap to the next line if it exceeds the available width. Flutter handles text wrapping automatically.',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),
            const Text(
              'Rich Text with different styles',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 4),
            RichText(
              text: TextSpan(
                style: const TextStyle(fontSize: 14, color: Colors.black),
                children: [
                  const TextSpan(text: 'You can have '),
                  TextSpan(
                    text: 'bold',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800],
                    ),
                  ),
                  const TextSpan(text: ', '),
                  TextSpan(
                    text: 'italic',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.green[800],
                    ),
                  ),
                  const TextSpan(text: ', or '),
                  TextSpan(
                    text: 'underlined',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.red[800],
                    ),
                  ),
                  const TextSpan(text: ' text all in one widget.'),
                ],
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Text with overflow handling',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the image widgets section
  Widget _buildImageWidgetsSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Network Image:'),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return SizedBox(
                    height: 120,
                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 120,
                    color: Colors.grey[300],
                    child: const Center(
                      child: Text('Error loading image'),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            const Text('Asset Image:'),
            const SizedBox(height: 8),
            const Text(
              'Note: Add images to your assets folder and update pubspec.yaml',
              style: TextStyle(
                fontSize: 12,
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the icon widgets section
  Widget _buildIconWidgetsSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Material Icons:'),
            const SizedBox(height: 8),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                _buildIconWithLabel('Home', Icons.home),
                _buildIconWithLabel('Settings', Icons.settings),
                _buildIconWithLabel('Favorite', Icons.favorite),
                _buildIconWithLabel('Search', Icons.search),
                _buildIconWithLabel('Account', Icons.account_circle),
              ],
            ),
            const SizedBox(height: 16),
            const Text('Styled Icons:'),
            const SizedBox(height: 8),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                _buildStyledIcon(Icons.star, Colors.amber),
                _buildStyledIcon(Icons.notifications, Colors.red),
                _buildStyledIcon(Icons.cloud, Colors.blue),
                _buildStyledIcon(Icons.brightness_7, Colors.orange),
                _buildStyledIcon(Icons.eco, Colors.green),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Builds an icon with a label
  Widget _buildIconWithLabel(String label, IconData icon) {
    return Column(
      children: [
        Icon(icon, size: 24),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  /// Builds a styled icon
  Widget _buildStyledIcon(IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, color: color, size: 24),
    );
  }

  /// Builds the button widgets section
  Widget _buildButtonWidgetsSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Elevated Buttons:'),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Default'),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  label: const Text('With Icon'),
                ),
                ElevatedButton(
                  onPressed: null,
                  child: const Text('Disabled'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text('Text Buttons:'),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text('Default'),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.info),
                  label: const Text('With Icon'),
                ),
                TextButton(
                  onPressed: null,
                  child: const Text('Disabled'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text('Outlined Buttons:'),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('Default'),
                ),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.save),
                  label: const Text('With Icon'),
                ),
                OutlinedButton(
                  onPressed: null,
                  child: const Text('Disabled'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text('IconButton:'),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite),
                  color: Colors.red,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.thumb_up),
                  color: Colors.blue,
                ),
                IconButton(
                  onPressed: null,
                  icon: const Icon(Icons.share),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the text field widgets section
  Widget _buildTextFieldWidgetsSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Basic TextField:'),
            const SizedBox(height: 8),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Enter text here',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Styled TextField:'),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'example@email.com',
                prefixIcon: const Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
            ),
            const SizedBox(height: 16),
            const Text('Password TextField:'),
            const SizedBox(height: 8),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
