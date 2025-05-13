import 'package:flutter_bloc/flutter_bloc.dart';

/// Counter Cubit
///
/// This is a simple Cubit that manages a counter state.
/// It demonstrates the basic usage of Cubit for state management.
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
