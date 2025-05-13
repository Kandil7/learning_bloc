import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_cubit.dart';

/// Counter Page
///
/// This page demonstrates how to use a Cubit for state management
/// in a simple counter application.
class CounterPage extends StatelessWidget {
  /// Route name for navigation
  static const routeName = '/counter-cubit';

  /// Creates a new CounterPage instance
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const CounterView(),
    );
  }
}

/// Counter View
///
/// This widget displays the counter UI and interacts with the CounterCubit.
class CounterView extends StatelessWidget {
  /// Creates a new CounterView instance
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter with Cubit'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => context.read<CounterCubit>().reset(),
            tooltip: 'Reset Counter',
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Counter Value:',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 16),
            BlocBuilder<CounterCubit, int>(
              builder: (context, state) {
                return Text(
                  '$state',
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () => context.read<CounterCubit>().decrement(),
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(width: 24),
                FloatingActionButton(
                  onPressed: () => context.read<CounterCubit>().increment(),
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(height: 48),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'This is a simple counter example using Cubit. '
                'Cubit is a simplified version of BLoC that doesn\'t use events. '
                'Instead, it exposes methods that can be called to trigger state changes.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 24),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Key Concepts:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Text('• BlocProvider: Creates and provides the Cubit'),
                  Text('• BlocBuilder: Rebuilds the UI when the state changes'),
                  Text('• context.read: Accesses the Cubit to call methods'),
                  SizedBox(height: 16),
                  Text(
                    'Cubit Implementation:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Text('class CounterCubit extends Cubit<int> {'),
                  Text('  CounterCubit() : super(0);'),
                  Text('  void increment() => emit(state + 1);'),
                  Text('  void decrement() => emit(state - 1);'),
                  Text('  void reset() => emit(0);'),
                  Text('}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
