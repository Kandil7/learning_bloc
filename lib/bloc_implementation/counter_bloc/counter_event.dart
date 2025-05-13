import 'package:equatable/equatable.dart';

/// Base class for all counter events
abstract class CounterEvent extends Equatable {
  /// Creates a new CounterEvent instance
  const CounterEvent();

  @override
  List<Object> get props => [];
}

/// Event to increment the counter
class CounterIncrementPressed extends CounterEvent {
  /// Creates a new CounterIncrementPressed event
  const CounterIncrementPressed();
}

/// Event to decrement the counter
class CounterDecrementPressed extends CounterEvent {
  /// Creates a new CounterDecrementPressed event
  const CounterDecrementPressed();
}

/// Event to reset the counter
class CounterResetPressed extends CounterEvent {
  /// Creates a new CounterResetPressed event
  const CounterResetPressed();
}
