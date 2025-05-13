import 'package:flutter/material.dart';

/// Settings Page
///
/// This is the settings page of the navigation example.
class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Settings',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          const Text(
            'This is the settings page of the navigation example.',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          _buildSettingItem(
            context,
            icon: Icons.notifications,
            title: 'Notifications',
            subtitle: 'Configure notification settings',
          ),
          _buildSettingItem(
            context,
            icon: Icons.lock,
            title: 'Privacy',
            subtitle: 'Configure privacy settings',
          ),
          _buildSettingItem(
            context,
            icon: Icons.color_lens,
            title: 'Theme',
            subtitle: 'Configure theme settings',
          ),
        ],
      ),
    );
  }

  Widget _buildSettingItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          // Do nothing for now
        },
      ),
    );
  }
}
