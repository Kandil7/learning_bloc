import 'package:equatable/equatable.dart';

/// Base class for all counter events
///
/// This abstract class is extended by all counter events.
abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

/// Event to increment the counter
///
/// This event is dispatched when the user wants to increment the counter.
class IncrementEvent extends CounterEvent {
  const IncrementEvent();
}

/// Event to decrement the counter
///
/// This event is dispatched when the user wants to decrement the counter.
class DecrementEvent extends CounterEvent {
  const DecrementEvent();
}

/// Event to reset the counter
///
/// This event is dispatched when the user wants to reset the counter to zero.
class ResetEvent extends CounterEvent {
  const ResetEvent();
}
