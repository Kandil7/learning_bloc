import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/counter_bloc.dart';
import '../bloc/counter_event.dart';

/// Widget to display the counter buttons
///
/// This widget provides buttons to increment, decrement, and reset the counter.
class CounterButtons extends StatelessWidget {
  /// Create a new counter buttons widget
  const CounterButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);
    
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              heroTag: 'decrement',
              onPressed: () {
                counterBloc.add(const DecrementEvent());
              },
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
            const SizedBox(width: 16),
            FloatingActionButton(
              heroTag: 'increment',
              onPressed: () {
                counterBloc.add(const IncrementEvent());
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ],
        ),
        const SizedBox(height: 16),
        FloatingActionButton.extended(
          heroTag: 'reset',
          onPressed: () {
            counterBloc.add(const ResetEvent());
          },
          tooltip: 'Reset',
          icon: const Icon(Icons.refresh),
          label: const Text('Reset'),
        ),
      ],
    );
  }
}
