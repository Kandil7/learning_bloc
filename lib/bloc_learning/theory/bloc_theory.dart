import 'package:flutter/material.dart';

class BlocTheory extends StatelessWidget {
  const BlocTheory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BLoC Pattern Theory'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              'What is BLoC Pattern?',
              'BLoC (Business Logic Component) is a design pattern created by Google to separate the business logic from the UI. It helps in managing state in Flutter applications in a predictable way.',
            ),
            _buildSection(
              'Core Components',
              '1. Events: Input to the BLoC that trigger state changes\n'
              '2. States: Output of the BLoC that represents part of your app state\n'
              '3. BLoC: Business logic component that converts events to states',
            ),
            _buildSection(
              'BLoC vs Cubit',
              'Cubit is a simplified version of BLoC:\n\n'
              '• BLoC: Uses events and states with mapEventToState method\n'
              '• Cubit: Uses functions that emit states directly\n\n'
              'Choose Cubit for simpler cases and BLoC for complex state management.',
            ),
            _buildSection(
              'Advantages of BLoC',
              '• Separation of concerns\n'
              '• Testability - business logic can be tested independently\n'
              '• Reusability - BLoCs can be reused across different UI components\n'
              '• Maintainability - easier to maintain as app grows',
            ),
            _buildSection(
              'Implementation Steps',
              '1. Define Events: Create a class for each event that can occur\n'
              '2. Define States: Create classes for different states of your UI\n'
              '3. Create BLoC: Implement the logic to transform events into states\n'
              '4. Connect UI: Use BlocProvider and BlocBuilder/BlocListener/BlocConsumer',
            ),
            _buildSection(
              'BLoC Widgets',
              '• BlocProvider: Provides a BLoC to its children\n'
              '• BlocBuilder: Rebuilds UI in response to state changes\n'
              '• BlocListener: Performs actions in response to state changes\n'
              '• BlocConsumer: Combines BlocBuilder and BlocListener\n'
              '• MultiBlocProvider: Provides multiple BLoCs to children\n'
              '• MultiBlocListener: Groups multiple BlocListeners',
            ),
            _buildSection(
              'Best Practices',
              '• Keep BLoCs focused on specific features\n'
              '• Use repositories to abstract data sources\n'
              '• Create meaningful event and state classes\n'
              '• Handle errors within the BLoC\n'
              '• Use BlocObserver for logging and analytics\n'
              '• Consider using Freezed for immutable state classes',
            ),
            _buildSection(
              'Common Patterns with BLoC',
              '• Repository Pattern: Abstract data sources\n'
              '• Dependency Injection: Provide dependencies to BLoCs\n'
              '• Factory Pattern: Create BLoCs with different configurations\n'
              '• Observer Pattern: React to state changes',
            ),
            _buildCodeExample(),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildCodeExample() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Basic BLoC Implementation Example',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('// Event', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('abstract class CounterEvent {}'),
              Text('class IncrementEvent extends CounterEvent {}'),
              Text('class DecrementEvent extends CounterEvent {}'),
              SizedBox(height: 12),
              Text('// State', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('class CounterState {'),
              Text('  final int count;'),
              Text('  const CounterState(this.count);'),
              Text('}'),
              SizedBox(height: 12),
              Text('// BLoC', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('class CounterBloc extends Bloc<CounterEvent, CounterState> {'),
              Text('  CounterBloc() : super(const CounterState(0)) {'),
              Text('    on<IncrementEvent>((event, emit) {'),
              Text('      emit(CounterState(state.count + 1));'),
              Text('    });'),
              Text('    on<DecrementEvent>((event, emit) {'),
              Text('      emit(CounterState(state.count - 1));'),
              Text('    });'),
              Text('  }'),
              Text('}'),
            ],
          ),
        ),
      ],
    );
  }
}