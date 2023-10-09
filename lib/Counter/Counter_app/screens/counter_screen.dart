import 'package:flutter/material.dart';

import '../widgets/counter_body.dart';
import '../widgets/counter_button.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: CounterBody(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:CounterButton(),
    );
  }
}
