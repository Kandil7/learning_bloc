import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mastery/bloc_journey/2_intermediate/error_handling/data/user_repository.dart';
import 'package:flutter_mastery/bloc_journey/2_intermediate/error_handling/user/user_bloc.dart';
import 'package:flutter_mastery/bloc_journey/2_intermediate/error_handling/user/user_event.dart';

/// User Details Widget
///
/// This widget displays detailed information about a user.
class UserDetails extends StatelessWidget {
  final User user;

  const UserDetails({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            child: Text(
              user.name[0],
              style: const TextStyle(fontSize: 40),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            user.name,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            user.email,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 10),
          Text(
            'User ID: ${user.id}',
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              // Clear user details and go back to user list
              context.read<UserBloc>().add(ClearUser());
              context.read<UserBloc>().add(FetchUsers());
            },
            child: const Text('Back to List'),
          ),
        ],
      ),
    );
  }
}
