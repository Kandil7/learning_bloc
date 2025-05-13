# BLoC Observer

This directory contains an example of using BLoC Observer to monitor BLoC and Cubit instances.

## What is BLoC Observer?

BLoC Observer is a class that allows you to observe all BLoC and Cubit instances in your application. It provides hooks for various lifecycle events, such as creation, state changes, event processing, transitions, errors, and closure.

## Implementation

### SimpleBlocObserver

```dart
class SimpleBlocObserver extends BlocObserver {
  const SimpleBlocObserver();

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    debugPrint('🟢 onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    debugPrint('📩 onEvent -- ${bloc.runtimeType}, $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    debugPrint('🔄 onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    debugPrint('🔀 onTransition -- ${bloc.runtimeType}, $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint('❌ onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    debugPrint('🔴 onClose -- ${bloc.runtimeType}');
  }
}
```

### Registering the Observer

```dart
void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
}
```

## Key Concepts

### 1. BlocObserver

`BlocObserver` is a class that allows you to observe all BLoC and Cubit instances in your application.

### 2. Lifecycle Events

BlocObserver provides hooks for various lifecycle events:

- **onCreate**: Called when a BLoC or Cubit is created.
- **onEvent**: Called when a BLoC receives an event (not called for Cubits).
- **onChange**: Called when a BLoC or Cubit emits a new state.
- **onTransition**: Called when a BLoC transitions from one state to another (not called for Cubits).
- **onError**: Called when a BLoC or Cubit throws an error.
- **onClose**: Called when a BLoC or Cubit is closed.

### 3. Global Observer

BlocObserver is a global observer that monitors all BLoC and Cubit instances in your application.

## Use Cases

BlocObserver is useful for:

1. **Debugging**: Monitor state changes and events to debug your application.
2. **Logging**: Log state changes and events for analytics or debugging.
3. **Error Handling**: Catch and handle errors in your BLoCs and Cubits.
4. **Analytics**: Track user interactions and state changes for analytics.

## Example

```dart
// Create a new CounterBloc
final bloc = CounterBloc();

// Add increment event
bloc.add(const CounterIncrementPressed());

// Output:
// 🟢 onCreate -- CounterBloc
// 📩 onEvent -- CounterBloc, CounterIncrementPressed
// 🔀 onTransition -- CounterBloc, Transition { currentState: 0, event: CounterIncrementPressed, nextState: 1 }
// 🔄 onChange -- CounterBloc, Change { currentState: 0, nextState: 1 }

// Close the bloc
bloc.close();

// Output:
// 🔴 onClose -- CounterBloc
```

## Next Steps

After understanding BLoC Observer, you can use it to debug your application and track state changes and events. You can also customize it to log to a file, send analytics, or handle errors in a centralized way.
