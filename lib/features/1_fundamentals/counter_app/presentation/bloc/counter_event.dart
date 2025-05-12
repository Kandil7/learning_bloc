import 'package:flutter/foundation.dart';

/// Events for the Counter BLoC
/// 
/// These events represent the actions that can be performed on the counter.
@immutable
abstract class CounterEvent {}

/// Event to increment the counter
class IncrementEvent extends CounterEvent {}

/// Event to decrement the counter
class DecrementEvent extends CounterEvent {}

/// Event to reset the counter to zero
class ResetEvent extends CounterEvent {}
