import 'package:flutter_bloc/flutter_bloc.dart';

/// Counter Cubit
///
/// This Cubit manages a simple counter state.
class CounterCubit extends Cubit<int> {
  /// Initialize the Cubit with an initial state of 0
  CounterCubit() : super(0);

  /// Increment the counter
  void increment() => emit(state + 1);

  /// Decrement the counter
  void decrement() => emit(state - 1);

  /// Reset the counter
  void reset() => emit(0);
}
