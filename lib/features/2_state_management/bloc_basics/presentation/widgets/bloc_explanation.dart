import 'package:flutter/material.dart';

/// Widget to display an explanation of the BLoC pattern
///
/// This widget provides a brief explanation of the BLoC pattern
/// and how it's implemented in this example.
class BlocExplanation extends StatelessWidget {
  /// Create a new BLoC explanation widget
  const BlocExplanation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'BLoC Pattern Explained',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'The BLoC (Business Logic Component) pattern separates business logic from the UI:',
            ),
            SizedBox(height: 8),
            Text('• Events: Input to the BLoC (IncrementEvent, DecrementEvent, ResetEvent)'),
            Text('• States: Output from the BLoC (CounterState with count property)'),
            Text('• BLoC: Processes events and emits states (CounterBloc)'),
            SizedBox(height: 8),
            Text(
              'In this example:',
            ),
            Text('• The UI dispatches events to the BLoC when buttons are pressed'),
            Text('• The BLoC processes these events and updates the state'),
            Text('• The UI rebuilds when the state changes using BlocBuilder'),
          ],
        ),
      ),
    );
  }
}
