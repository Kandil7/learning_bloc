import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_event.dart';

/// Counter BLoC
///
/// This is a simple BLoC that manages a counter state.
/// It demonstrates the basic usage of BLoC for state management.
class CounterBloc extends Bloc<CounterEvent, int> {
  /// Creates a new CounterBloc with an initial state of 0
  CounterBloc() : super(0) {
    on<CounterIncrementPressed>(_onIncrement);
    on<CounterDecrementPressed>(_onDecrement);
    on<CounterResetPressed>(_onReset);
  }

  /// Handle the increment event
  void _onIncrement(CounterIncrementPressed event, Emitter<int> emit) {
    emit(state + 1);
  }

  /// Handle the decrement event
  void _onDecrement(CounterDecrementPressed event, Emitter<int> emit) {
    emit(state - 1);
  }

  /// Handle the reset event
  void _onReset(CounterResetPressed event, Emitter<int> emit) {
    emit(0);
  }
}
