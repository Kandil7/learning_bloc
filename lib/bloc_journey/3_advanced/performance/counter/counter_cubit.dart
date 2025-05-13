import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/performance/counter/counter_state.dart';

/// Counter Cubit
///
/// This Cubit manages a counter state.
class CounterCubit extends Cubit<CounterState> {
  /// Initialize the Cubit with an initial state
  CounterCubit() : super(const CounterState(count: 0));

  /// Increment the counter
  void increment() {
    emit(CounterState(count: state.count + 1));
  }

  /// Decrement the counter
  void decrement() {
    emit(CounterState(count: state.count - 1));
  }

  /// Reset the counter
  void reset() {
    emit(const CounterState(count: 0));
  }
}
