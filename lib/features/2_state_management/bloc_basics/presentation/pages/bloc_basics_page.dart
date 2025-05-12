import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/counter_bloc.dart';
import '../widgets/bloc_explanation.dart';
import '../widgets/counter_buttons.dart';
import '../widgets/counter_display.dart';

/// Page for demonstrating BLoC basics
///
/// This page demonstrates the basics of the BLoC pattern
/// with a simple counter example.
class BlocBasicsPage extends StatelessWidget {
  /// Create a new BLoC basics page
  const BlocBasicsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('BLoC Basics'),
          centerTitle: true,
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CounterDisplay(),
                SizedBox(height: 32),
                CounterButtons(),
                SizedBox(height: 32),
                BlocExplanation(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
