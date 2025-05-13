import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mastery/bloc_journey/1_basics/counter_cubit/counter_cubit.dart';

/// Counter Page using Cubit
///
/// This page demonstrates how to use a Cubit for state management
/// in a simple counter application.
class CounterCubitPage extends StatelessWidget {
  const CounterCubitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // BlocProvider is used to create and provide the CounterCubit to the widget tree
    // This ensures that the Cubit is properly disposed when the widget is removed
    return BlocProvider(
      // The create callback is used to create a new instance of CounterCubit
      create: (context) => CounterCubit(),
      child: const CounterCubitView(),
    );
  }
}

/// The main view of the Counter Page
///
/// This widget is responsible for displaying the UI and interacting with the CounterCubit
class CounterCubitView extends StatelessWidget {
  const CounterCubitView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Access the CounterCubit instance provided by the BlocProvider
    // final counterCubit = context.read<CounterCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter with Cubit'),
        actions: [
          // Reset button in the app bar
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              // Use context.read to get the Cubit instance and call the reset method
              // context.read is used for methods that don't need to rebuild the UI
              context.read<CounterCubit>().reset();
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
                'This is a simple counter example using Cubit. '
                'Cubit is a simplified version of BLoC that doesn\'t use events. '
                'Instead, it exposes methods that can be called to trigger state changes.',
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
            BlocBuilder<CounterCubit, int>(
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
                    // Use context.read to get the Cubit instance and call the decrement method
                    context.read<CounterCubit>().decrement();
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
                    // Use context.read to get the Cubit instance and call the increment method
                    context.read<CounterCubit>().increment();
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
                  Text('• BlocProvider: Creates and provides the Cubit to the widget tree'),
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
