import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mastery/bloc_journey/2_intermediate/bloc_communication/color/color_bloc.dart';
import 'package:flutter_mastery/bloc_journey/2_intermediate/bloc_communication/color/color_event.dart';
import 'package:flutter_mastery/bloc_journey/2_intermediate/bloc_communication/color/color_state.dart';
import 'package:flutter_mastery/bloc_journey/2_intermediate/bloc_communication/counter/counter_cubit.dart';

/// BLoC Communication Page
///
/// This page demonstrates how to implement BLoC-to-BLoC communication.
class BlocCommunicationPage extends StatelessWidget {
  const BlocCommunicationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterCubit()),
        BlocProvider(create: (context) => ColorBloc()),
      ],
      child: const BlocCommunicationView(),
    );
  }
}

/// BLoC Communication View
///
/// This widget contains the UI and demonstrates BLoC-to-BLoC communication.
class BlocCommunicationView extends StatelessWidget {
  const BlocCommunicationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BLoC-to-BLoC Communication'),
      ),
      body: Column(
        children: [
          // Explanation text
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'This example demonstrates BLoC-to-BLoC communication. '
              'The CounterCubit manages a counter, and the ColorBloc changes the color '
              'based on the counter value. When the counter changes, the ColorBloc is notified '
              'and updates the color accordingly.',
              style: TextStyle(fontSize: 16),
            ),
          ),
          
          // Counter display
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Counter Value:',
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 16),
                  BlocBuilder<CounterCubit, int>(
                    builder: (context, state) {
                      return Text(
                        '$state',
                        style: const TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 40),
                  
                  // Color display
                  const Text(
                    'Color:',
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 16),
                  BlocBuilder<ColorBloc, ColorState>(
                    builder: (context, state) {
                      return Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: state.color,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 40),
                  
                  // Counter controls
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          // Decrement the counter
                          context.read<CounterCubit>().decrement();
                          
                          // Update the color based on the new counter value
                          final newCounterValue = context.read<CounterCubit>().state;
                          context.read<ColorBloc>().add(
                                ChangeColorBasedOnCounter(newCounterValue),
                              );
                        },
                        icon: const Icon(Icons.remove),
                        label: const Text('Decrement'),
                      ),
                      const SizedBox(width: 16),
                      ElevatedButton.icon(
                        onPressed: () {
                          // Increment the counter
                          context.read<CounterCubit>().increment();
                          
                          // Update the color based on the new counter value
                          final newCounterValue = context.read<CounterCubit>().state;
                          context.read<ColorBloc>().add(
                                ChangeColorBasedOnCounter(newCounterValue),
                              );
                        },
                        icon: const Icon(Icons.add),
                        label: const Text('Increment'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Reset the counter
                      context.read<CounterCubit>().reset();
                      
                      // Update the color based on the new counter value
                      final newCounterValue = context.read<CounterCubit>().state;
                      context.read<ColorBloc>().add(
                            ChangeColorBasedOnCounter(newCounterValue),
                          );
                    },
                    child: const Text('Reset'),
                  ),
                ],
              ),
            ),
          ),
          
          // Color legend
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Color Legend:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 8),
                _buildColorLegendItem(Colors.blue, 'Counter = 0'),
                _buildColorLegendItem(Colors.green, 'Counter is even'),
                _buildColorLegendItem(Colors.red, 'Counter is odd'),
                _buildColorLegendItem(Colors.purple, 'Counter is multiple of 5'),
              ],
            ),
          ),
          
          // Code explanation
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.grey[200],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Key Concepts:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 8),
                Text('• MultiBlocProvider: Provides multiple BLoCs to the widget tree'),
                Text('• BLoC-to-BLoC communication: One BLoC reacts to changes in another'),
                Text('• context.read: Accesses BLoCs to read state or add events'),
                Text('• BlocBuilder: Rebuilds UI components based on state'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Build a color legend item
  Widget _buildColorLegendItem(Color color, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(width: 8),
          Text(text),
        ],
      ),
    );
  }
}
