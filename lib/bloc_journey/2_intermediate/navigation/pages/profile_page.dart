import 'package:flutter/material.dart';

/// Profile Page
///
/// This is the profile page of the navigation example.
class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircleAvatar(
            radius: 50,
            child: Icon(Icons.person, size: 50),
          ),
          SizedBox(height: 20),
          Text(
            'John Doe',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'john.doe@example.com',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 20),
          Text(
            'This is the profile page of the navigation example.',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
