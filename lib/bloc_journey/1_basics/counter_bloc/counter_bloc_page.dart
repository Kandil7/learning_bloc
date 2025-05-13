import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mastery/bloc_journey/1_basics/counter_bloc/counter_bloc.dart';
import 'package:flutter_mastery/bloc_journey/1_basics/counter_bloc/counter_event.dart';

/// Counter Page using BLoC
///
/// This page demonstrates how to use a BLoC for state management
/// in a simple counter application.
class CounterBlocPage extends StatelessWidget {
  const CounterBlocPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // BlocProvider is used to create and provide the CounterBloc to the widget tree
    // This ensures that the BLoC is properly disposed when the widget is removed
    return BlocProvider(
      // The create callback is used to create a new instance of CounterBloc
      create: (context) => CounterBloc(),
      child: const CounterBlocView(),
    );
  }
}

/// The main view of the Counter Page
///
/// This widget is responsible for displaying the UI and interacting with the CounterBloc
class CounterBlocView extends StatelessWidget {
  const CounterBlocView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter with BLoC'),
        actions: [
          // Reset button in the app bar
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              // Use context.read to get the BLoC instance and add the reset event
              // context.read is used for methods that don't need to rebuild the UI
              context.read<CounterBloc>().add(CounterResetPressed());
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Explanation text
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'This is a simple counter example using BLoC. '
                'BLoC uses events to trigger state changes. '
                'Events are dispatched by the UI and processed by the BLoC.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'Counter Value:',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 16),
            // BlocBuilder is used to rebuild the UI when the state changes
            // It takes a builder function that receives the current state
            BlocBuilder<CounterBloc, int>(
              builder: (context, state) {
                return Text(
                  '$state',
                  style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                );
              },
            ),
            const SizedBox(height: 40),
            // Increment and decrement buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Decrement button
                ElevatedButton.icon(
                  onPressed: () {
                    // Use context.read to get the BLoC instance and add the decrement event
                    context.read<CounterBloc>().add(CounterDecrementPressed());
                  },
                  icon: const Icon(Icons.remove),
                  label: const Text('Decrement'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                ),
                const SizedBox(width: 16),
                // Increment button
                ElevatedButton.icon(
                  onPressed: () {
                    // Use context.read to get the BLoC instance and add the increment event
                    context.read<CounterBloc>().add(CounterIncrementPressed());
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Increment'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            // Code explanation
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
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
                  Text('• BlocProvider: Creates and provides the BLoC to the widget tree'),
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
                  Text(''),
                  Text('  // Other event handlers...'),
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
