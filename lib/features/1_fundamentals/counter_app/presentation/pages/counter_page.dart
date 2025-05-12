import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/counter_bloc.dart';
import '../widgets/counter_buttons.dart';
import '../widgets/counter_display.dart';
import '../widgets/counter_explanation.dart';

/// Counter Page
/// 
/// This page demonstrates a simple counter application using the BLoC pattern.
/// It shows how to separate UI and business logic using BLoC.
class CounterPage extends StatelessWidget {
  /// Create a new counter page
  const CounterPage({Key? key}) : super(key: key);

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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CounterDisplay(),
                SizedBox(height: 24),
                CounterExplanation(),
              ],
            ),
          ),
        ),
        floatingActionButton: const CounterButtons(),
      ),
    );
  }
}
