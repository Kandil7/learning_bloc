import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mastery/bloc_journey/2_intermediate/navigation/navigation_bloc.dart';
import 'package:flutter_mastery/bloc_journey/2_intermediate/navigation/navigation_event.dart';

/// Details Page
///
/// This is the details page of the navigation example.
/// It displays details for a specific item based on the ID parameter.
class DetailsPage extends StatelessWidget {
  final int id;

  const DetailsPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get item details based on ID
    final item = _getItemDetails(id);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Item #$id',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Text(
            'Name: ${item['name']}',
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 10),
          Text(
            'Description: ${item['description']}',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              // Navigate back
              context.read<NavigationBloc>().add(NavigateBack());
            },
            child: const Text('Go Back'),
          ),
        ],
      ),
    );
  }

  /// Get item details based on ID
  ///
  /// This is a mock function that returns dummy data.
  Map<String, String> _getItemDetails(int id) {
    final items = {
      1: {
        'name': 'Item One',
        'description': 'This is the first item in our collection.',
      },
      2: {
        'name': 'Item Two',
        'description': 'This is the second item in our collection.',
      },
    };

    return items[id] ?? {'name': 'Unknown', 'description': 'Item not found'};
  }
}
