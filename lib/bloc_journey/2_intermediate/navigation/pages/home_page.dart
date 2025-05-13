import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mastery/bloc_journey/2_intermediate/navigation/navigation_bloc.dart';
import 'package:flutter_mastery/bloc_journey/2_intermediate/navigation/navigation_event.dart';

/// Home Page
///
/// This is the home page of the navigation example.
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Home Page',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          const Text(
            'This is the home page of the navigation example.',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              // Navigate to the details page with ID 1
              context.read<NavigationBloc>().add(NavigateToDetails(1));
            },
            child: const Text('View Item 1'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // Navigate to the details page with ID 2
              context.read<NavigationBloc>().add(NavigateToDetails(2));
            },
            child: const Text('View Item 2'),
          ),
        ],
      ),
    );
  }
}
