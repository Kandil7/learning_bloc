import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../counter_bloc/counter_bloc.dart';
import '../counter_bloc/counter_event.dart';

class CounterButton extends StatelessWidget {
  const CounterButton({super.key});

  @override
  Widget build(BuildContext context) {
    var counterBloc = context.read<CounterBloc>();
    return Row(
       crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FloatingActionButton(
          heroTag: " add ",
          onPressed: () {
            counterBloc.add(CounterIncrement());
          },
          child: const Icon(Icons.add),
        ),
        SizedBox(width: 20,),
        FloatingActionButton(
          heroTag: " sub ",
          onPressed: () {
            counterBloc.add(CounterDecrement());
          },
          child: const Icon(Icons.remove),
        ),
      ],
    );
  }
}
