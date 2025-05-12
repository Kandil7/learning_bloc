import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/counter_bloc.dart';
import '../bloc/counter_event.dart';

/// Widget to display the counter buttons
class CounterButtons extends StatelessWidget {
  /// Create a new counter buttons widget
  const CounterButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          heroTag: 'decrement',
          onPressed: () {
            context.read<CounterBloc>().add(DecrementEvent());
          },
          tooltip: 'Decrement',
          child: const Icon(Icons.remove),
        ),
        const SizedBox(width: 12),
        FloatingActionButton(
          heroTag: 'reset',
          onPressed: () {
            context.read<CounterBloc>().add(ResetEvent());
          },
          tooltip: 'Reset',
          child: const Icon(Icons.refresh),
        ),
        const SizedBox(width: 12),
        FloatingActionButton(
          heroTag: 'increment',
          onPressed: () {
            context.read<CounterBloc>().add(IncrementEvent());
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}
