import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../counter_bloc/counter_bloc.dart';
import '../counter_bloc/counter_event.dart';
import '../counter_cubit/counter_cubit.dart';
import 'simple_bloc_observer.dart';

/// BLoC Observer Page
///
/// This page demonstrates how to use BLoC Observer to monitor BLoC and Cubit instances.
class BlocObserverPage extends StatefulWidget {
  /// Route name for navigation
  static const routeName = '/bloc-observer';

  /// Creates a new BlocObserverPage instance
  const BlocObserverPage({Key? key}) : super(key: key);

  @override
  State<BlocObserverPage> createState() => _BlocObserverPageState();
}

class _BlocObserverPageState extends State<BlocObserverPage> {
  // List to store debug logs
  final List<String> _logs = [];
  // ScrollController for the logs ListView
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Set up a custom BLoC observer that adds logs to our list
    Bloc.observer = SimpleBlocObserver();
    // Override the print function to capture logs
    _overridePrint();
  }

  @override
  void dispose() {
    // Restore the original print function
    _restorePrint();
    // Dispose the scroll controller
    _scrollController.dispose();
    super.dispose();
  }

  // Custom print function to capture logs
  void _customPrint(String message) {
    // Add to logs
    setState(() {
      _logs.add(message);
      // Scroll to the bottom of the logs
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      });
    });
  }

  // Override the print function to capture logs
  void _overridePrint() {
    // Set our custom BlocObserver with the custom print function
    Bloc.observer = _CustomBlocObserver(
      onLog: _customPrint,
    );
  }

  // Restore the original print function
  void _restorePrint() {
    // Reset to a new default BlocObserver
    Bloc.observer = const SimpleBlocObserver();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BLoC Observer'),
        actions: [
          // Clear logs button
          IconButton(
            icon: const Icon(Icons.clear_all),
            onPressed: () {
              setState(() {
                _logs.clear();
              });
            },
            tooltip: 'Clear Logs',
          ),
        ],
      ),
      body: Column(
        children: [
          // Explanation text
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'BLoC Observer is used to observe all BLoC and Cubit instances in the application. '
              'It provides hooks for various lifecycle events, such as creation, state changes, '
              'event processing, transitions, errors, and closure. '
              'This is useful for debugging and logging.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),

          // BLoC and Cubit examples
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Cubit example
                ElevatedButton(
                  onPressed: () {
                    // Create a new CounterCubit
                    final cubit = CounterCubit();
                    // Increment the counter
                    cubit.increment();
                    // Decrement the counter
                    cubit.decrement();
                    // Reset the counter
                    cubit.reset();
                    // Close the cubit
                    cubit.close();
                  },
                  child: const Text('Test Cubit'),
                ),

                // BLoC example
                ElevatedButton(
                  onPressed: () {
                    // Create a new CounterBloc
                    final bloc = CounterBloc();
                    // Add increment event
                    bloc.add(const CounterIncrementPressed());
                    // Add decrement event
                    bloc.add(const CounterDecrementPressed());
                    // Add reset event
                    bloc.add(const CounterResetPressed());
                    // Close the bloc
                    bloc.close();
                  },
                  child: const Text('Test BLoC'),
                ),

                // Error example
                ElevatedButton(
                  onPressed: () {
                    // Create a new CounterBloc
                    final bloc = CounterBloc();
                    // Add an error
                    bloc.addError(Exception('Test error'), StackTrace.current);
                    // Close the bloc
                    bloc.close();
                  },
                  child: const Text('Test Error'),
                ),
              ],
            ),
          ),

          // Logs
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Debug Logs:',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      controller: _scrollController,
                      itemCount: _logs.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4.0,
                            horizontal: 8.0,
                          ),
                          child: Text(
                            _logs[index],
                            style: const TextStyle(
                              fontFamily: 'monospace',
                              fontSize: 14.0,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Code explanation
          Container(
            margin: const EdgeInsets.all(16.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'BlocObserver Implementation:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 8),
                Text('class SimpleBlocObserver extends BlocObserver {'),
                Text('  @override'),
                Text('  void onCreate(BlocBase bloc) {'),
                Text('    super.onCreate(bloc);'),
                Text('    print(\'onCreate -- \${bloc.runtimeType}\');'),
                Text('  }'),
                Text(''),
                Text('  @override'),
                Text('  void onChange(BlocBase bloc, Change change) {'),
                Text('    super.onChange(bloc, change);'),
                Text(
                    '    print(\'onChange -- \${bloc.runtimeType}, \$change\');'),
                Text('  }'),
                Text(''),
                Text('  // Other lifecycle methods...'),
                Text('}'),
                SizedBox(height: 8),
                Text('// Register the observer'),
                Text('Bloc.observer = SimpleBlocObserver();'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Custom BLoC Observer for capturing logs
class _CustomBlocObserver extends BlocObserver {
  final Function(String) onLog;

  const _CustomBlocObserver({required this.onLog});

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    onLog('🟢 onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    onLog('📩 onEvent -- ${bloc.runtimeType}, $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    onLog('🔄 onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    onLog('🔀 onTransition -- ${bloc.runtimeType}, $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    onLog('❌ onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    onLog('🔴 onClose -- ${bloc.runtimeType}');
  }
}
