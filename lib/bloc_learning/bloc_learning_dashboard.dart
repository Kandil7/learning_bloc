import 'package:flutter/material.dart';
import 'package:learning_bloc/bloc_learning/examples/counter_example/counter_example_screen.dart';
import 'package:learning_bloc/bloc_learning/examples/form_validation_example/form_validation_screen.dart';
import 'package:learning_bloc/bloc_learning/examples/repository_pattern_example/repository_pattern_screen.dart';
import 'package:learning_bloc/bloc_learning/examples/state_management_example/state_management_screen.dart';
import 'package:learning_bloc/bloc_learning/examples/stream_example/stream_example_screen.dart';
import 'package:learning_bloc/bloc_learning/theory/bloc_theory.dart';
import 'package:learning_bloc/connectivty_app/widget/connectivity_screen.dart';
import 'package:learning_bloc/post_app/screens/post_screen.dart';
import 'package:learning_bloc/todo_app/pages/todos_page.dart';

class BlocLearningDashboard extends StatelessWidget {
  const BlocLearningDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BLoC Pattern Learning'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('BLoC Theory'),
            _buildCard(
              title: 'BLoC Pattern Fundamentals',
              description: 'Learn the core concepts of BLoC pattern and its architecture',
              icon: Icons.book,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BlocTheory()),
              ),
            ),
            const SizedBox(height: 16),
            
            _buildSectionTitle('Basic Examples'),
            _buildCard(
              title: 'Counter Example',
              description: 'Simple counter implementation using BLoC',
              icon: Icons.add_circle,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CounterExampleScreen()),
              ),
            ),
            _buildCard(
              title: 'State Management',
              description: 'Learn different states and transitions in BLoC',
              icon: Icons.sync_alt,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const StateManagementScreen()),
              ),
            ),
            
            const SizedBox(height: 16),
            _buildSectionTitle('Intermediate Examples'),
            _buildCard(
              title: 'Form Validation',
              description: 'Implement form validation using BLoC pattern',
              icon: Icons.check_circle,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FormValidationScreen()),
              ),
            ),
            _buildCard(
              title: 'Stream Example',
              description: 'Working with streams in BLoC pattern',
              icon: Icons.stream,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const StreamExampleScreen()),
              ),
            ),
            
            const SizedBox(height: 16),
            _buildSectionTitle('Advanced Examples'),
            _buildCard(
              title: 'Repository Pattern',
              description: 'Implementing repository pattern with BLoC',
              icon: Icons.storage,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RepositoryPatternScreen()),
              ),
            ),
            
            const SizedBox(height: 16),
            _buildSectionTitle('Real-World Examples'),
            _buildCard(
              title: 'Posts App',
              description: 'Fetching and displaying posts from API using BLoC',
              icon: Icons.article,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PostScreen()),
              ),
            ),
            _buildCard(
              title: 'Todos App',
              description: 'Todo list management using BLoC pattern',
              icon: Icons.check_box,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TodosPage()),
              ),
            ),
            _buildCard(
              title: 'Connectivity App',
              description: 'Monitor network connectivity using BLoC',
              icon: Icons.wifi,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ConnectivtyScreen()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required String description,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Icon(icon, size: 36),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}