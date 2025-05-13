# Cubit Basics

This directory contains a simple counter example implemented using Cubit.

## What is Cubit?

Cubit is a simplified version of BLoC that doesn't use events. Instead, it exposes methods that can be called to trigger state changes.

## Implementation

### CounterCubit

```dart
class CounterCubit extends Cubit<int> {
  /// Creates a new CounterCubit with an initial state of 0
  CounterCubit() : super(0);

  /// Increment the counter by 1
  void increment() => emit(state + 1);

  /// Decrement the counter by 1
  void decrement() => emit(state - 1);

  /// Reset the counter to 0
  void reset() => emit(0);
}
```

### UI Integration

```dart
BlocProvider(
  create: (_) => CounterCubit(),
  child: Scaffold(
    body: Center(
      child: Column(
        children: [
          BlocBuilder<CounterCubit, int>(
            builder: (context, state) {
              return Text('$state');
            },
          ),
          FloatingActionButton(
            onPressed: () => context.read<CounterCubit>().increment(),
            child: const Icon(Icons.add),
          ),
        ],
      ),
    ),
  ),
)
```

## Key Concepts

### 1. Cubit Class

A Cubit is a class that extends `Cubit<State>` and can emit new states.

### 2. State

The state is the output of a Cubit. It can be a simple type (like `int` in this example) or a complex class.

### 3. emit

The `emit` method is used to emit a new state. It is called from within the Cubit methods.

### 4. BlocProvider

`BlocProvider` is a Flutter widget that provides a Cubit to its children via InheritedWidget. It's responsible for creating and closing the Cubit.

### 5. BlocBuilder

`BlocBuilder` is a Flutter widget that rebuilds when a new state is emitted from a Cubit.

### 6. context.read

`context.read<Cubit>()` is used to access the Cubit instance provided by the BlocProvider.

## Advantages of Cubit

1. **Simplicity**: Cubit is simpler than BLoC because it doesn't use events.
2. **Less Boilerplate**: Cubit requires less code than BLoC.
3. **Easy to Understand**: Cubit is easier to understand for beginners.

## When to Use Cubit

Use Cubit when:

1. You have simple state management needs.
2. You don't need to track the history of state changes.
3. You want to reduce boilerplate code.

## Next Steps

After understanding Cubit, you can move on to BLoC, which adds the concept of events for more complex state management.
