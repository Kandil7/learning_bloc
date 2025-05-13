import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mastery/bloc_journey/2_intermediate/error_handling/data/user_repository.dart';
import 'package:flutter_mastery/bloc_journey/2_intermediate/error_handling/user/user_bloc.dart';
import 'package:flutter_mastery/bloc_journey/2_intermediate/error_handling/user/user_event.dart';

/// User List Widget
///
/// This widget displays a list of users and handles user selection.
class UserList extends StatelessWidget {
  final List<User> users;

  const UserList({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            leading: CircleAvatar(
              child: Text(user.name[0]),
            ),
            title: Text(user.name),
            subtitle: Text(user.email),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Fetch user details when tapped
              context.read<UserBloc>().add(FetchUserById(user.id));
            },
          ),
        );
      },
    );
  }
}
