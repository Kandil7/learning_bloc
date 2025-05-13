import 'package:flutter/material.dart';

/// BLoC Theory Page
///
/// This page explains the core concepts of the BLoC pattern.
class BlocTheoryPage extends StatelessWidget {
  const BlocTheoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BLoC Pattern Theory')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle(context, 'What is BLoC?'),
            _buildParagraph(
              'BLoC stands for Business Logic Component. It is a state management pattern that helps separate business logic from the presentation layer.',
            ),
            _buildParagraph(
              'The BLoC pattern was introduced by Google at Google I/O 2018 and has since become one of the most popular state management solutions in Flutter.',
            ),

            const SizedBox(height: 16),
            _buildSectionTitle(context, 'Core Concepts'),
            _buildSubtitle(context, 'Events'),
            _buildParagraph(
              'Events are the inputs to a BLoC. They are dispatched by the UI to trigger state changes.',
            ),
            _buildCodeBlock('''
// Example of an event
sealed class CounterEvent {}

class CounterIncrementPressed extends CounterEvent {}
class CounterDecrementPressed extends CounterEvent {}
'''),

            _buildSubtitle(context, 'States'),
            _buildParagraph(
              'States represent the output of a BLoC. The UI rebuilds based on the current state.',
            ),
            _buildCodeBlock('''
// Example of a state
// For a simple counter, the state is just an integer
// For complex cases, states are usually classes
'''),

            _buildSubtitle(context, 'BLoC'),
            _buildParagraph(
              'The BLoC (Business Logic Component) connects events to states. It receives events and emits new states.',
            ),
            _buildCodeBlock('''
class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterIncrementPressed>((event, emit) => emit(state + 1));
    on<CounterDecrementPressed>((event, emit) => emit(state - 1));
  }
}
'''),

            const SizedBox(height: 16),
            _buildSectionTitle(context, 'Cubit vs BLoC'),
            _buildParagraph(
              'Cubit is a simplified version of BLoC. It doesn\'t use events, instead, it exposes methods that can be called to trigger state changes.',
            ),
            _buildCodeBlock('''
class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}
'''),
            _buildParagraph(
              'Use Cubit for simple state management and BLoC for more complex cases where you need to handle events.',
            ),

            const SizedBox(height: 16),
            _buildSectionTitle(context, 'BLoC Architecture'),
            _buildParagraph(
              'The BLoC pattern follows a unidirectional data flow:',
            ),
            _buildParagraph('1. UI dispatches events to the BLoC'),
            _buildParagraph('2. BLoC processes events and updates the state'),
            _buildParagraph('3. UI rebuilds based on the new state'),
            Center(
              child: Image.asset(
                'assets/bloc_architecture.png',
                fit: BoxFit.contain,
                height: 200,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 300,
                    height: 200,
                    color: Colors.grey.shade200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.image_not_supported, size: 48),
                        SizedBox(height: 16),
                        Text('BLoC Architecture Diagram'),
                        SizedBox(height: 8),
                        Text(
                          'UI → Events → BLoC → States → UI',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 16),
            _buildSectionTitle(context, 'Benefits of BLoC'),
            _buildParagraph(
              '• Separation of concerns: Business logic is separated from the UI',
            ),
            _buildParagraph(
              '• Testability: Business logic can be tested independently',
            ),
            _buildParagraph(
              '• Reusability: BLoCs can be reused across different widgets',
            ),
            _buildParagraph(
              '• Maintainability: Code is more organized and easier to maintain',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(title, style: Theme.of(context).textTheme.headlineMedium),
    );
  }

  Widget _buildSubtitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(title, style: Theme.of(context).textTheme.titleLarge),
    );
  }

  Widget _buildParagraph(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(text, style: const TextStyle(fontSize: 16.0)),
    );
  }

  Widget _buildCodeBlock(String code) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        code,
        style: const TextStyle(fontFamily: 'monospace', fontSize: 14.0),
      ),
    );
  }
}
