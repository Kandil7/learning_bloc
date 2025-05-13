import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mastery/bloc_journey/2_intermediate/error_handling/data/user_repository.dart';
import 'package:flutter_mastery/bloc_journey/2_intermediate/error_handling/user/user_bloc.dart';
import 'package:flutter_mastery/bloc_journey/2_intermediate/error_handling/user/user_event.dart';
import 'package:flutter_mastery/bloc_journey/2_intermediate/error_handling/user/user_state.dart';
import 'package:flutter_mastery/bloc_journey/2_intermediate/error_handling/widgets/error_view.dart';
import 'package:flutter_mastery/bloc_journey/2_intermediate/error_handling/widgets/loading_view.dart';
import 'package:flutter_mastery/bloc_journey/2_intermediate/error_handling/widgets/user_details.dart';
import 'package:flutter_mastery/bloc_journey/2_intermediate/error_handling/widgets/user_list.dart';

/// Error Handling Page
///
/// This page demonstrates how to handle loading states and errors with BLoC.
class ErrorHandlingPage extends StatelessWidget {
  const ErrorHandlingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(
        userRepository: UserRepository(),
      )..add(FetchUsers()), // Fetch users when the page is created
      child: const ErrorHandlingView(),
    );
  }
}

/// Error Handling View
///
/// This widget contains the UI and demonstrates error handling with BLoC.
class ErrorHandlingView extends StatelessWidget {
  const ErrorHandlingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error Handling with BLoC'),
      ),
      body: Column(
        children: [
          // Explanation text
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'This example demonstrates how to handle loading states and errors with BLoC. '
              'The app fetches user data from a simulated API that randomly succeeds or fails. '
              'The UI shows different states based on the BLoC state: loading, error, or data.',
              style: TextStyle(fontSize: 16),
            ),
          ),
          
          // Main content
          Expanded(
            child: BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                // Show different UI based on the state
                return switch (state) {
                  UserInitial() => Center(
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<UserBloc>().add(FetchUsers());
                        },
                        child: const Text('Load Users'),
                      ),
                    ),
                  UserLoading() => const LoadingView(),
                  UsersLoaded() => UserList(users: state.users),
                  UserLoaded() => UserDetails(user: state.user),
                  UserError() => ErrorView(message: state.message),
                };
              },
            ),
          ),
          
          // Code explanation
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.grey[200],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Key Concepts:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 8),
                Text('• Sealed classes for state: Clear state transitions'),
                Text('• Loading state: Show loading indicator while fetching data'),
                Text('• Error handling: Catch exceptions and show error messages'),
                Text('• BlocBuilder: Rebuild UI based on different states'),
                SizedBox(height: 16),
                Text(
                  'Implementation Details:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 8),
                Text('1. Repository simulates API calls with random success/failure'),
                Text('2. BLoC handles events and emits appropriate states'),
                Text('3. UI shows different widgets based on the current state'),
                Text('4. Error view provides a retry option'),
              ],
            ),
          ),
        ],
      ),
      // Refresh button in the bottom right corner
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Refresh the user list
          context.read<UserBloc>().add(FetchUsers());
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
