import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mastery/bloc_journey/1_basics/bloc_observer/custom_bloc_observer.dart';
import 'package:flutter_mastery/bloc_journey/1_basics/counter_bloc/counter_bloc.dart';
import 'package:flutter_mastery/bloc_journey/1_basics/counter_bloc/counter_event.dart';
import 'package:flutter_mastery/bloc_journey/1_basics/counter_cubit/counter_cubit.dart';

/// BLoC Observer Page
///
/// This page demonstrates how to use BLoC Observer to debug BLoC state changes.
class BlocObserverPage extends StatefulWidget {
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
    Bloc.observer = CustomBlocObserver(debug: false);
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

  // Original print function
  static void Function(Object?) originalPrint = print;
  
  // Override the print function to capture logs
  void _overridePrint() {
    print = (Object? object) {
      originalPrint(object);
      setState(() {
        _logs.add(object.toString());
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
    };
  }

  // Restore the original print function
  void _restorePrint() {
    print = originalPrint;
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
                    bloc.add(CounterIncrementPressed());
                    // Add decrement event
                    bloc.add(CounterDecrementPressed());
                    // Add reset event
                    bloc.add(CounterResetPressed());
                    // Close the bloc
                    bloc.close();
                  },
                  child: const Text('Test BLoC'),
                ),
                
                // Error example
                ElevatedButton(
                  onPressed: () {
                    // Create a new CounterCubit
                    final cubit = CounterCubit();
                    // Trigger an error
                    try {
                      throw Exception('Test error in Cubit');
                    } catch (e, stackTrace) {
                      cubit.addError(e, stackTrace);
                    }
                    // Close the cubit
                    cubit.close();
                  },
                  child: const Text('Test Error'),
                ),
              ],
            ),
          ),
          
          // Logs section
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.grey),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Debug Logs:',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'BLoC Observer Implementation:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 8),
                Text('class CustomBlocObserver extends BlocObserver {'),
                Text('  @override'),
                Text('  void onCreate(BlocBase bloc) {'),
                Text('    super.onCreate(bloc);'),
                Text('    print(\'onCreate -- \${bloc.runtimeType}\');'),
                Text('  }'),
                Text(''),
                Text('  @override'),
                Text('  void onChange(BlocBase bloc, Change change) {'),
                Text('    super.onChange(bloc, change);'),
                Text('    print(\'onChange -- \${bloc.runtimeType}, \$change\');'),
                Text('  }'),
                Text(''),
                Text('  // Other lifecycle methods...'),
                Text('}'),
                SizedBox(height: 8),
                Text('// Register the observer'),
                Text('Bloc.observer = CustomBlocObserver();'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
