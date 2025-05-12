import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/counter_bloc.dart';
import '../bloc/counter_state.dart';

/// Widget to display the current counter value
class CounterDisplay extends StatelessWidget {
  /// Create a new counter display widget
  const CounterDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Counter Value:',
          style: TextStyle(fontSize: 24),
        ),
        const SizedBox(height: 16),
        BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Text(
              '${state.count}',
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            );
          },
        ),
      ],
    );
  }
}
