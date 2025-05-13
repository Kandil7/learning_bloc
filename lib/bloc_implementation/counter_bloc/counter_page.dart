import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_bloc.dart';
import 'counter_event.dart';

/// Counter Page
///
/// This page demonstrates how to use a BLoC for state management
/// in a simple counter application.
class CounterPage extends StatelessWidget {
  /// Route name for navigation
  static const routeName = '/counter-bloc';

  /// Creates a new CounterPage instance
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: const CounterView(),
    );
  }
}

/// Counter View
///
/// This widget displays the counter UI and interacts with the CounterBloc.
class CounterView extends StatelessWidget {
  /// Creates a new CounterView instance
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter with BLoC'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => context.read<CounterBloc>().add(const CounterResetPressed()),
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
            BlocBuilder<CounterBloc, int>(
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
                  onPressed: () => context.read<CounterBloc>().add(const CounterDecrementPressed()),
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(width: 24),
                FloatingActionButton(
                  onPressed: () => context.read<CounterBloc>().add(const CounterIncrementPressed()),
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(height: 48),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'This is a simple counter example using BLoC. '
                'BLoC uses events to trigger state changes. '
                'Events are dispatched by the UI and processed by the BLoC.',
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
                  Text('• BlocProvider: Creates and provides the BLoC'),
                  Text('• BlocBuilder: Rebuilds the UI when the state changes'),
                  Text('• context.read: Accesses the BLoC to add events'),
                  Text('• Events: Used to trigger state changes'),
                  SizedBox(height: 16),
                  Text(
                    'BLoC Implementation:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Text('class CounterBloc extends Bloc<CounterEvent, int> {'),
                  Text('  CounterBloc() : super(0) {'),
                  Text('    on<CounterIncrementPressed>(_onIncrement);'),
                  Text('    on<CounterDecrementPressed>(_onDecrement);'),
                  Text('    on<CounterResetPressed>(_onReset);'),
                  Text('  }'),
                  Text(''),
                  Text('  void _onIncrement(CounterIncrementPressed event, Emitter<int> emit) {'),
                  Text('    emit(state + 1);'),
                  Text('  }'),
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
