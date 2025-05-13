# BLoC-to-BLoC Communication

This directory contains an example of BLoC-to-BLoC communication.

## Overview

In complex applications, BLoCs often need to communicate with each other. This example demonstrates how to implement BLoC-to-BLoC communication using StreamSubscription.

## Implementation

### CounterCubit

```dart
class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
  void reset() => emit(0);
}
```

### ColorCubit

```dart
class ColorCubit extends Cubit<ColorState> {
  final CounterCubit _counterCubit;
  late final StreamSubscription<int> _counterSubscription;

  ColorCubit({required CounterCubit counterCubit})
      : _counterCubit = counterCubit,
        super(const ColorState(color: Colors.blue)) {
    // Listen to the CounterCubit
    _counterSubscription = _counterCubit.stream.listen(_onCounterChanged);
  }

  void _onCounterChanged(int count) {
    // Change color based on counter value
    if (count.isEven) {
      emit(const ColorState(color: Colors.blue));
    } else {
      emit(const ColorState(color: Colors.red));
    }
  }

  @override
  Future<void> close() {
    _counterSubscription.cancel();
    return super.close();
  }
}
```

### ThemeCubit

```dart
class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState(themeMode: ThemeMode.light));

  void toggleTheme() {
    final newThemeMode = state.themeMode == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
    emit(ThemeState(themeMode: newThemeMode));
  }
}
```

### UI Integration

```dart
MultiBlocProvider(
  providers: [
    BlocProvider(create: (_) => CounterCubit()),
    BlocProvider(
      create: (context) => ColorCubit(
        counterCubit: context.read<CounterCubit>(),
      ),
    ),
    BlocProvider(create: (_) => ThemeCubit()),
  ],
  child: BlocBuilder<ThemeCubit, ThemeState>(
    builder: (context, themeState) {
      return MaterialApp(
        themeMode: themeState.themeMode,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        home: const BlocCommunicationView(),
      );
    },
  ),
)
```

## Key Concepts

### 1. StreamSubscription

`StreamSubscription` is used to listen to the stream of state changes from another BLoC.

### 2. Dependency Injection

The dependent BLoC (ColorCubit) receives the BLoC it depends on (CounterCubit) through constructor injection.

### 3. Resource Management

It's important to cancel the StreamSubscription when the BLoC is closed to prevent memory leaks.

### 4. MultiBlocProvider

`MultiBlocProvider` is used to provide multiple BLoCs to the widget tree.

## Communication Patterns

There are several patterns for BLoC-to-BLoC communication:

### 1. Direct Dependency

One BLoC depends directly on another BLoC, as shown in this example.

```dart
ColorCubit({required CounterCubit counterCubit})
```

### 2. Event-Based Communication

One BLoC adds events to another BLoC.

```dart
void onSomeEvent() {
  otherBloc.add(SomeEvent());
}
```

### 3. Repository-Based Communication

BLoCs communicate through a shared repository.

```dart
class Repository {
  final _controller = StreamController<Data>.broadcast();
  Stream<Data> get stream => _controller.stream;
  void update(Data data) => _controller.add(data);
}
```

### 4. BlocListener

Use BlocListener to perform actions in response to state changes in another BLoC.

```dart
BlocListener<CounterBloc, int>(
  listener: (context, state) {
    context.read<ColorBloc>().add(ColorEvent.update(state.isEven ? Colors.blue : Colors.red));
  },
  child: Container(),
)
```

## Use Cases

BLoC-to-BLoC communication is useful for:

1. **Theme Changes**: Update the theme based on user preferences.
2. **Authentication**: Update the UI based on authentication state.
3. **Shopping Cart**: Update the cart badge based on cart items.
4. **Notifications**: Show notifications based on application state.

## Next Steps

After understanding BLoC-to-BLoC communication, you can:

1. Implement more complex communication patterns.
2. Use BlocListener for UI-based communication.
3. Implement a shared repository for communication.
4. Use the bloc_concurrency package for advanced event handling.
