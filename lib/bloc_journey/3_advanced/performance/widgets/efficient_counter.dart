import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/performance/counter/counter_cubit.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/performance/counter/counter_state.dart';

/// Efficient Counter Widget
///
/// This widget demonstrates efficient BLoC usage.
class EfficientCounter extends StatelessWidget {
  const EfficientCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('EfficientCounter build');
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Efficient Counter',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'This counter only rebuilds the necessary widgets when the count changes.',
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        const CountDisplay(),
        const SizedBox(height: 16),
        const CounterControls(),
        const SizedBox(height: 16),
        const ExpensiveWidget(),
      ],
    );
  }
}

/// Count Display Widget
///
/// This widget displays the counter value.
class CountDisplay extends StatelessWidget {
  const CountDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('CountDisplay build');
    return BlocBuilder<CounterCubit, CounterState>(
      buildWhen: (previous, current) => previous.count != current.count,
      builder: (context, state) {
        print('CountDisplay BlocBuilder build');
        return Text(
          '${state.count}',
          style: const TextStyle(
            fontSize: 60,
            fontWeight: FontWeight.bold,
          ),
        );
      },
    );
  }
}

/// Counter Controls Widget
///
/// This widget provides controls for the counter.
class CounterControls extends StatelessWidget {
  const CounterControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('CounterControls build');
    return Column(
      children: [
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
      ],
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
