import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_event.dart';
import 'counter_state.dart';

/// Counter BLoC
/// 
/// This BLoC handles the business logic for the counter feature.
/// It processes events and emits new states.
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  /// Create a new CounterBloc with an initial state of 0
  CounterBloc() : super(const CounterState(0)) {
    on<IncrementEvent>(_onIncrement);
    on<DecrementEvent>(_onDecrement);
    on<ResetEvent>(_onReset);
  }

  /// Handle the increment event
  /// 
  /// Increments the counter by 1 and emits a new state
  void _onIncrement(IncrementEvent event, Emitter<CounterState> emit) {
    emit(CounterState(state.count + 1));
  }

  /// Handle the decrement event
  /// 
  /// Decrements the counter by 1 and emits a new state
  void _onDecrement(DecrementEvent event, Emitter<CounterState> emit) {
    emit(CounterState(state.count - 1));
  }

  /// Handle the reset event
  /// 
  /// Resets the counter to 0 and emits a new state
  void _onReset(ResetEvent event, Emitter<CounterState> emit) {
    emit(const CounterState(0));
  }
}
