import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/performance/counter/counter_cubit.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/performance/counter/counter_state.dart';

/// Inefficient Counter Widget
///
/// This widget demonstrates inefficient BLoC usage.
class InefficientCounter extends StatelessWidget {
  const InefficientCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('InefficientCounter build');
    return BlocBuilder<CounterCubit, CounterState>(
      builder: (context, state) {
        print('InefficientCounter BlocBuilder build');
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Inefficient Counter',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'This counter rebuilds the entire widget tree when the count changes.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              '${state.count}',
              style: const TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterCubit>().decrement();
                  },
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterCubit>().increment();
                  },
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                context.read<CounterCubit>().reset();
              },
              child: const Text('Reset'),
            ),
            const SizedBox(height: 16),
            const ExpensiveWidget(),
          ],
        );
      },
    );
  }
}

/// Expensive Widget
///
/// This widget simulates an expensive build operation.
class ExpensiveWidget extends StatelessWidget {
  const ExpensiveWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('ExpensiveWidget build');
    
    // Simulate expensive build
    int result = 0;
    for (int i = 0; i < 1000000; i++) {
      result += i;
    }
    
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          const Text(
            'Expensive Widget',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'This widget is expensive to build and should not rebuild unnecessarily.',
          ),
          const SizedBox(height: 8),
          Text('Computed value: $result'),
        ],
      ),
    );
  }
}
