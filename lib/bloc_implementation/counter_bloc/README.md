# BLoC Basics

This directory contains a simple counter example implemented using BLoC.

## What is BLoC?

BLoC (Business Logic Component) is a design pattern that helps separate business logic from the UI. It uses events to trigger state changes and states to represent the UI.

## Implementation

### CounterEvent

```dart
abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

class CounterIncrementPressed extends CounterEvent {
  const CounterIncrementPressed();
}

class CounterDecrementPressed extends CounterEvent {
  const CounterDecrementPressed();
}

class CounterResetPressed extends CounterEvent {
  const CounterResetPressed();
}
```

### CounterBloc

```dart
class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterIncrementPressed>(_onIncrement);
    on<CounterDecrementPressed>(_onDecrement);
    on<CounterResetPressed>(_onReset);
  }

  void _onIncrement(CounterIncrementPressed event, Emitter<int> emit) {
    emit(state + 1);
  }

  void _onDecrement(CounterDecrementPressed event, Emitter<int> emit) {
    emit(state - 1);
  }

  void _onReset(CounterResetPressed event, Emitter<int> emit) {
    emit(0);
  }
}
```

### UI Integration

```dart
BlocProvider(
  create: (_) => CounterBloc(),
  child: Scaffold(
    body: Center(
      child: Column(
        children: [
          BlocBuilder<CounterBloc, int>(
            builder: (context, state) {
              return Text('$state');
            },
          ),
          FloatingActionButton(
            onPressed: () => context.read<CounterBloc>().add(const CounterIncrementPressed()),
            child: const Icon(Icons.add),
          ),
        ],
      ),
    ),
  ),
)
```

## Key Concepts

### 1. Events

Events are the inputs to a BLoC. They are dispatched by the UI and processed by the BLoC.

### 2. BLoC Class

A BLoC is a class that extends `Bloc<Event, State>` and processes events to emit states.

### 3. State

The state is the output of a BLoC. It can be a simple type (like `int` in this example) or a complex class.

### 4. emit

The `emit` method is used to emit a new state. It is called from within the event handlers.

### 5. BlocProvider

`BlocProvider` is a Flutter widget that provides a BLoC to its children via InheritedWidget. It's responsible for creating and closing the BLoC.

### 6. BlocBuilder

`BlocBuilder` is a Flutter widget that rebuilds when a new state is emitted from a BLoC.

### 7. context.read

`context.read<Bloc>()` is used to access the BLoC instance provided by the BlocProvider.

## Advantages of BLoC

1. **Traceability**: BLoC provides better traceability of state changes through events.
2. **Testability**: BLoC is easy to test because it's independent of the UI.
3. **Reusability**: BLoC can be reused across different UI components.
4. **Maintainability**: BLoC helps maintain a clean separation of concerns.

## When to Use BLoC

Use BLoC when:

1. You need to track the history of state changes.
2. You have complex state management needs.
3. You want to separate business logic from the UI.
4. You need to test your business logic independently of the UI.

## Comparison with Cubit

BLoC is more powerful than Cubit but requires more boilerplate code. Use BLoC when you need the additional power of events, and use Cubit when you want simplicity.
