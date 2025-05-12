import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import '../bloc/post_bloc.dart';
import 'post_screen.dart';

/// Posts page
///
/// This page demonstrates how to fetch and display posts from a REST API
/// using the BLoC pattern and Clean Architecture.
class PostsPage extends StatelessWidget {
  /// Create a new posts page
  const PostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts App'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildExplanation(),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (context) => PostBloc()..add(const FetchPostsEvent()),
                        child: const PostScreen(),
                      ),
                    ),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'Open Posts App',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Build the explanation widget
  Widget _buildExplanation() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Posts App Example',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'This example demonstrates how to fetch and display posts from a REST API using the BLoC pattern and Clean Architecture:',
            ),
            SizedBox(height: 8),
            Text('• Fetches posts from the JSONPlaceholder API'),
            Text('• Implements Clean Architecture principles'),
            Text('• Uses BLoC for state management'),
            Text('• Handles loading, success, and error states'),
            Text('• Implements pagination with infinite scrolling'),
            SizedBox(height: 8),
            Text(
              'The app is structured following Clean Architecture:',
            ),
            Text('• Domain Layer: Post entity, PostRepository interface, GetPosts use case'),
            Text('• Data Layer: PostModel, PostRemoteDataSource, PostRepositoryImpl'),
            Text('• Presentation Layer: PostBloc, PostEvent, PostState, UI components'),
          ],
        ),
      ),
    );
  }
}
