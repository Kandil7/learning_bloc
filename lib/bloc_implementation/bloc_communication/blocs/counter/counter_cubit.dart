import 'package:flutter_bloc/flutter_bloc.dart';

/// Counter Cubit
///
/// This Cubit manages a simple counter state.
class CounterCubit extends Cubit<int> {
  /// Creates a new CounterCubit instance with an initial state of 0
  CounterCubit() : super(0);

  /// Increment the counter by 1
  void increment() => emit(state + 1);

  /// Decrement the counter by 1
  void decrement() => emit(state - 1);

  /// Reset the counter to 0
  void reset() => emit(0);
}
