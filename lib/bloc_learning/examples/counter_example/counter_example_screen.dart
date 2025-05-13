import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mastery/bloc_learning/examples/counter_example/counter_bloc.dart';

class CounterExampleScreen extends StatelessWidget {
  const CounterExampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Counter Example'),
          centerTitle: true,
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
              BlocBuilder<CounterBloc, CounterState>(
                builder: (context, state) {
                  return Text(
                    '${state.count}',
                    style: const TextStyle(
                        fontSize: 48, fontWeight: FontWeight.bold),
                  );
                },
              ),
              const SizedBox(height: 24),
              _buildExplanation(),
            ],
          ),
        ),
        floatingActionButton: _CounterButtons(),
      ),
    );
  }

  Widget _buildExplanation() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'BLoC Pattern Explained:',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 8),
          Text(
            '1. Events (IncrementEvent, DecrementEvent, ResetEvent) are dispatched from UI',
            style: TextStyle(fontSize: 14),
          ),
          Text(
            '2. CounterBloc processes events and emits new CounterState',
            style: TextStyle(fontSize: 14),
          ),
          Text(
            '3. BlocBuilder rebuilds UI when state changes',
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}

class _CounterButtons extends StatelessWidget {
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
