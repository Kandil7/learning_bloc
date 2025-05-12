import 'package:flutter/foundation.dart';

/// State for the Counter BLoC
/// 
/// This class represents the state of the counter.
@immutable
class CounterState {
  /// The current count value
  final int count;
  
  /// Create a new counter state with the given count
  const CounterState(this.count);
}
