import 'package:flutter/material.dart';

/// Widget to display an explanation of the BLoC pattern
class CounterExplanation extends StatelessWidget {
  /// Create a new counter explanation widget
  const CounterExplanation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'BLoC Pattern Explained:',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 8),
          Text(
            '1. Events (IncrementEvent, DecrementEvent, ResetEvent) are dispatched from UI',
            style: TextStyle(fontSize: 14),
          ),
          Text(
            '2. CounterBloc processes events and emits new CounterState',
            style: TextStyle(fontSize: 14),
          ),
          Text(
            '3. BlocBuilder rebuilds UI when state changes',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 16),
          Text(
            'This separation of concerns makes the code more maintainable and testable:',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          Text(
            '• UI components only handle presentation logic',
            style: TextStyle(fontSize: 14),
          ),
          Text(
            '• BLoC contains all business logic',
            style: TextStyle(fontSize: 14),
          ),
          Text(
            '• Events represent user actions',
            style: TextStyle(fontSize: 14),
          ),
          Text(
            '• States represent the UI state at a given time',
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
