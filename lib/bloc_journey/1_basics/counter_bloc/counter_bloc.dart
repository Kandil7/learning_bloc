import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mastery/bloc_journey/1_basics/counter_bloc/counter_event.dart';

/// A simple counter BLoC that manages an integer state
///
/// This demonstrates the BLoC pattern with events.
/// Unlike Cubit, BLoC uses events to trigger state changes.
class CounterBloc extends Bloc<CounterEvent, int> {
  /// Initialize the BLoC with an initial state of 0
  ///
  /// The super(0) call passes the initial state to the parent Bloc class
  /// We then register event handlers for each event type
  CounterBloc() : super(0) {
    // Register event handlers
    on<CounterIncrementPressed>(_onIncrement);
    on<CounterDecrementPressed>(_onDecrement);
    on<CounterResetPressed>(_onReset);
  }

  /// Handle the increment event
  ///
  /// The event handler receives the event and an emitter
  /// The emitter is used to emit new states
  void _onIncrement(CounterIncrementPressed event, Emitter<int> emit) {
    // Emit the current state + 1
    emit(state + 1);
  }

  /// Handle the decrement event
  ///
  /// The event handler receives the event and an emitter
  /// The emitter is used to emit new states
  void _onDecrement(CounterDecrementPressed event, Emitter<int> emit) {
    // Emit the current state - 1
    emit(state - 1);
  }

  /// Handle the reset event
  ///
  /// The event handler receives the event and an emitter
  /// The emitter is used to emit new states
  void _onReset(CounterResetPressed event, Emitter<int> emit) {
    // Emit 0
    emit(0);
  }
}
