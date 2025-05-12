import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/bloc_learning/examples/repository_pattern_example/user_bloc.dart';
import 'package:learning_bloc/bloc_learning/examples/repository_pattern_example/user_repository.dart';

class RepositoryPatternScreen extends StatelessWidget {
  const RepositoryPatternScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(UserRepository())..add(LoadUsersEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Repository Pattern Example'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildExplanation(),
              const SizedBox(height: 24),
              _buildUserList(),
              const SizedBox(height: 16),
              _buildRefreshButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExplanation() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.green[200]!),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Repository Pattern with BLoC',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 8),
          Text(
            'The Repository Pattern provides a clean API for data access:',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 4),
          Text('• Abstracts data sources (API, database, cache)', style: TextStyle(fontSize: 14)),
          Text('• Makes code more testable with dependency injection', style: TextStyle(fontSize: 14)),
          Text('• Centralizes data access logic', style: TextStyle(fontSize: 14)),
          Text('• Allows easy switching between data sources', style: TextStyle(fontSize: 14)),
          Text('• BLoC interacts with repository instead of directly with data sources', style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildUserList() {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is UserLoadedState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Users:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              ...state.users.map((user) => Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(user.name[0]),
                      ),
                      title: Text(user.name),
                      subtitle: Text(user.email),
                    ),
                  )),
            ],
          );
        } else if (state is UserErrorState) {
          return Center(
            child: Column(
              children: [
                const Icon(Icons.error, color: Colors.red, size: 48),
                const SizedBox(height: 16),
                Text(
                  'Error: ${state.message}',
                  style: const TextStyle(color: Colors.red),
                ),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildRefreshButton(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
        onPressed: () {
          context.read<UserBloc>().add(LoadUsersEvent());
        },
        icon: const Icon(Icons.refresh),
        label: const Text('Refresh Users'),
      ),
    );
  }
}