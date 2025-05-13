import 'package:flutter/material.dart';
import 'package:flutter_mastery/bloc_learning/examples/adapter_pattern_example/screens/adapter_screen.dart';
import 'package:flutter_mastery/bloc_learning/examples/builder_pattern_example/screens/builder_screen.dart';
import 'package:flutter_mastery/bloc_learning/examples/command_pattern_example/screens/command_screen.dart';
import 'package:flutter_mastery/bloc_learning/examples/factory_pattern_example/screens/product_screen.dart';
import 'package:flutter_mastery/bloc_learning/examples/observer_pattern_example/screens/observer_screen.dart';
import 'package:flutter_mastery/bloc_learning/examples/repository_pattern_example/repository_pattern_screen.dart';
import 'package:flutter_mastery/bloc_learning/examples/singleton_pattern_example/screens/theme_screen.dart';
import 'package:flutter_mastery/bloc_learning/examples/strategy_pattern_example/screens/payment_screen.dart';

/// DesignPatternsHome
///
/// A screen that provides navigation to all the design pattern examples.
class DesignPatternsHome extends StatelessWidget {
  const DesignPatternsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Design Patterns with BLoC'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 24),
            _buildPatternCard(
              context,
              title: 'Factory Pattern',
              description: 'Create objects without specifying their concrete classes',
              icon: Icons.factory,
              color: Colors.amber,
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const ProductScreen()),
              ),
            ),
            const SizedBox(height: 16),
            _buildPatternCard(
              context,
              title: 'Singleton Pattern',
              description: 'Ensure a class has only one instance with global access',
              icon: Icons.one_k,
              color: Colors.blue,
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const ThemeScreen()),
              ),
            ),
            const SizedBox(height: 16),
            _buildPatternCard(
              context,
              title: 'Observer Pattern',
              description: 'Define a one-to-many dependency between objects',
              icon: Icons.visibility,
              color: Colors.green,
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const ObserverScreen()),
              ),
            ),
            const SizedBox(height: 16),
            _buildPatternCard(
              context,
              title: 'Strategy Pattern',
              description: 'Define a family of algorithms and make them interchangeable',
              icon: Icons.swap_horiz,
              color: Colors.purple,
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const PaymentScreen()),
              ),
            ),
            const SizedBox(height: 16),
            _buildPatternCard(
              context,
              title: 'Repository Pattern',
              description: 'Abstracts data sources and centralizes data access logic',
              icon: Icons.storage,
              color: Colors.green,
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const RepositoryPatternScreen()),
              ),
            ),
            const SizedBox(height: 16),
            _buildPatternCard(
              context,
              title: 'Builder Pattern',
              description: 'Constructs complex objects step by step',
              icon: Icons.build,
              color: Colors.indigo,
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const BuilderScreen()),
              ),
            ),
            const SizedBox(height: 16),
            _buildPatternCard(
              context,
              title: 'Adapter Pattern',
              description: 'Converts one interface to another that clients expect',
              icon: Icons.settings_ethernet,
              color: Colors.orange,
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const AdapterScreen()),
              ),
            ),
            const SizedBox(height: 16),
            _buildPatternCard(
              context,
              title: 'Command Pattern',
              description: 'Encapsulates a request as an object',
              icon: Icons.terminal,
              color: Colors.teal,
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const CommandScreen()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Design Patterns in Flutter',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'This section demonstrates common design patterns implemented in Flutter with BLoC for state management.',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 8),
          Text(
            'Select a pattern below to see it in action:',
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildPatternCard(
    BuildContext context, {
    required String title,
    required String description,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: color.withOpacity(0.2),
                radius: 24,
                child: Icon(icon, color: color),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, color: Colors.grey[400]),
            ],
          ),
        ),
      ),
    );
  }
}