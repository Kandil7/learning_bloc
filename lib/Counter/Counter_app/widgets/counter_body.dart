import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../counter_bloc/counter_bloc.dart';
import '../counter_bloc/counter_state.dart';

class CounterBody extends StatelessWidget {
  const CounterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
        if(state is CounterInitial){
          return  const Center(
            child: Text(
              '0',
              style: TextStyle(fontSize: 24),
            ),
          );
        }
        else if(state is CounterChangedValue){
          return  Center(
            child: Text(
              state.counter.toString(),
              style: const TextStyle(fontSize: 24),
            ),
          );
        }
        else{
          return const Center(
            child: Text(
              '0',
              style: TextStyle(fontSize: 24),
            ),
          );
        }
      },
    );
  }
}
