import 'package:flutter/material.dart';

/// A widget showcasing Material Design components in Flutter
///
/// This widget demonstrates:
/// - AppBar
/// - Cards
/// - Buttons (Elevated, Text, Outlined, FAB)
/// - Bottom Navigation
/// - Tabs
/// - Dialogs
/// - Lists
/// - Snackbars
/// - Navigation Drawer
class MaterialComponentsShowcase extends StatelessWidget {
  /// Creates a new Material components showcase
  const MaterialComponentsShowcase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(context, 'AppBar'),
        _buildAppBarSection(context),
        const SizedBox(height: 24),
        
        _buildSectionTitle(context, 'Cards'),
        _buildCardsSection(),
        const SizedBox(height: 24),
        
        _buildSectionTitle(context, 'Buttons'),
        _buildButtonsSection(context),
        const SizedBox(height: 24),
        
        _buildSectionTitle(context, 'Lists'),
        _buildListsSection(),
        const SizedBox(height: 24),
        
        _buildSectionTitle(context, 'Dialogs & Bottom Sheets'),
        _buildDialogsSection(context),
        const SizedBox(height: 24),
        
        _buildSectionTitle(context, 'Snackbars'),
        _buildSnackbarsSection(context),
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

  /// Builds the AppBar section
  Widget _buildAppBarSection(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'AppBar is a Material Design app bar that can contain a toolbar, tabs, and other widgets.',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  AppBar(
                    title: const Text('Standard AppBar'),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    actions: [
                      IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.more_vert),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  AppBar(
                    title: const Text('AppBar with Leading'),
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    leading: IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(height: 16),
                  AppBar(
                    title: const Text('Centered Title'),
                    backgroundColor: Colors.teal,
                    centerTitle: true,
                    elevation: 8,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the Cards section
  Widget _buildCardsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Cards are surfaces that display content and actions on a single topic.',
          style: TextStyle(fontSize: 14),
        ),
        const SizedBox(height: 16),
        Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Basic Card',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Cards contain content and actions about a single subject.',
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text('ACTION 1'),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('ACTION 2'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: Image.network(
                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Card with Image',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Cards can include images, text, and buttons.',
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text('SHARE'),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text('EXPLORE'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Builds the Buttons section
  Widget _buildButtonsSection(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Material Design provides several button types for different use cases.',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            const Text('Elevated Buttons:'),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('NORMAL'),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  label: const Text('WITH ICON'),
                ),
                ElevatedButton(
                  onPressed: null,
                  child: const Text('DISABLED'),
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
                  child: const Text('NORMAL'),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.info),
                  label: const Text('WITH ICON'),
                ),
                TextButton(
                  onPressed: null,
                  child: const Text('DISABLED'),
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
                  child: const Text('NORMAL'),
                ),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.save),
                  label: const Text('WITH ICON'),
                ),
                OutlinedButton(
                  onPressed: null,
                  child: const Text('DISABLED'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text('Floating Action Button (FAB):'),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {},
                  child: const Icon(Icons.add),
                  tooltip: 'Standard FAB',
                ),
                FloatingActionButton.extended(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  label: const Text('Extended FAB'),
                ),
                FloatingActionButton.small(
                  onPressed: () {},
                  child: const Icon(Icons.add),
                  tooltip: 'Small FAB',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the Lists section
  Widget _buildListsSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Lists are continuous, vertical indexes of text or images.',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            const Text('Standard List:'),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text('${index + 1}'),
                    ),
                    title: Text('List Item ${index + 1}'),
                    subtitle: Text('Subtitle for item ${index + 1}'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {},
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            const Text('List with Dividers:'),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Separated Item ${index + 1}'),
                    onTap: () {},
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the Dialogs section
  Widget _buildDialogsSection(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Dialogs inform users about a task and can contain critical information or require decisions.',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Alert Dialog'),
                        content: const Text(
                          'This is an alert dialog. It\'s used to inform the user about situations that require acknowledgement.',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('CANCEL'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const Text('Show Alert Dialog'),
                ),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => SimpleDialog(
                        title: const Text('Simple Dialog'),
                        children: [
                          SimpleDialogOption(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Option 1'),
                          ),
                          SimpleDialogOption(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Option 2'),
                          ),
                          SimpleDialogOption(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Option 3'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const Text('Show Simple Dialog'),
                ),
                ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => Container(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'Bottom Sheet',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'This is a modal bottom sheet. It\'s used to display additional content that is related to the current screen.',
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('CLOSE'),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: const Text('Show Bottom Sheet'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the Snackbars section
  Widget _buildSnackbarsSection(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Snackbars provide brief messages about app processes at the bottom of the screen.',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('This is a basic snackbar'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  child: const Text('Basic Snackbar'),
                ),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Snackbar with action'),
                        action: SnackBarAction(
                          label: 'UNDO',
                          onPressed: () {},
                        ),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                  child: const Text('Snackbar with Action'),
                ),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Row(
                          children: const [
                            Icon(Icons.info, color: Colors.white),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text('Snackbar with custom styling'),
                            ),
                          ],
                        ),
                        backgroundColor: Colors.teal,
                        duration: const Duration(seconds: 2),
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    );
                  },
                  child: const Text('Styled Snackbar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
