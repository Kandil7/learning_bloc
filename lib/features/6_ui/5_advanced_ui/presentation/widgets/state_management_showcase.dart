import 'dart:async';

import 'package:flutter/material.dart';

/// A widget that showcases different state management approaches in Flutter
///
/// This widget demonstrates:
/// - setState for simple state management
/// - Provider pattern
/// - BLoC pattern
/// - Riverpod (mentioned in examples)
class StateManagementShowcase extends StatefulWidget {
  /// Creates a new state management showcase
  const StateManagementShowcase({Key? key}) : super(key: key);

  @override
  State<StateManagementShowcase> createState() => _StateManagementShowcaseState();
}

class _StateManagementShowcaseState extends State<StateManagementShowcase> {
  // Simple setState counter
  int _setStateCounter = 0;
  
  // Provider pattern example (simplified)
  final _counterProvider = _CounterProvider();
  
  // BLoC pattern example (simplified)
  final _counterBloc = _CounterBloc();
  
  @override
  void dispose() {
    _counterBloc.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'State Management Approaches',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          
          // setState Example
          _buildSectionTitle('1. setState (Simplest Approach)'),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Text(
                    'Using setState to manage component state',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                  const SizedBox(height: 8),
                  Text('Counter: $_setStateCounter'),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _setStateCounter++;
                      });
                    },
                    child: const Text('Increment'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          
          // Provider Pattern Example
          _buildSectionTitle('2. Provider Pattern'),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Text(
                    'Using Provider to separate business logic',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                  const SizedBox(height: 8),
                  // Listen to provider value changes
                  StreamBuilder<int>(
                    stream: _counterProvider.counterStream,
                    initialData: 0,
                    builder: (context, snapshot) {
                      return Column(
                        children: [
                          Text('Counter: ${snapshot.data}'),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () {
                              _counterProvider.increment();
                            },
                            child: const Text('Increment'),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          
          // BLoC Pattern Example
          _buildSectionTitle('3. BLoC Pattern'),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Text(
                    'Using BLoC to separate business logic with events',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                  const SizedBox(height: 8),
                  // Listen to BLoC state changes
                  StreamBuilder<int>(
                    stream: _counterBloc.counterStream,
                    initialData: 0,
                    builder: (context, snapshot) {
                      return Column(
                        children: [
                          Text('Counter: ${snapshot.data}'),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  _counterBloc.eventSink.add(_CounterEvent.increment);
                                },
                                child: const Text('Increment'),
                              ),
                              const SizedBox(width: 8),
                              ElevatedButton(
                                onPressed: () {
                                  _counterBloc.eventSink.add(_CounterEvent.decrement);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                ),
                                child: const Text('Decrement'),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          
          // Riverpod Example (Mentioned)
          _buildSectionTitle('4. Riverpod (Modern Provider)'),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Text(
                    'Riverpod is a modern state management solution',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Key benefits of Riverpod:\n'  
                    '• Type safety\n'
                    '• Dependency overriding\n'
                    '• Testability\n'
                    '• No BuildContext dependency\n'
                    '• Provider composition',
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Example implementation would require Riverpod package',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Builds a section title
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}

/// Simple provider implementation for the counter
class _CounterProvider {
  final _counterController = StreamController<int>.broadcast();
  int _counter = 0;
  
  Stream<int> get counterStream => _counterController.stream;
  
  void increment() {
    _counter++;
    _counterController.sink.add(_counter);
  }
  
  void dispose() {
    _counterController.close();
  }
}

/// BLoC pattern implementation
enum _CounterEvent { increment, decrement }

class _CounterBloc {
  final _counterController = StreamController<int>.broadcast();
  final _eventController = StreamController<_CounterEvent>();
  int _counter = 0;
  
  _CounterBloc() {
    // Listen to events and update state accordingly
    _eventController.stream.listen(_mapEventToState);
  }
  
  Stream<int> get counterStream => _counterController.stream;
  Sink<_CounterEvent> get eventSink => _eventController.sink;
  
  void _mapEventToState(_CounterEvent event) {
    switch (event) {
      case _CounterEvent.increment:
        _counter++;
        break;
      case _CounterEvent.decrement:
        _counter--;
        break;
    }
    
    _counterController.sink.add(_counter);
  }
  
  void dispose() {
    _counterController.close();
    _eventController.close();
  }
}