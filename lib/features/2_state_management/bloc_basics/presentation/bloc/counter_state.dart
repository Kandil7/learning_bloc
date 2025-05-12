import 'package:equatable/equatable.dart';

/// State for the counter BLoC
///
/// This class represents the state of the counter.
/// It contains the current count value.
class CounterState extends Equatable {
  /// The current count value
  final int count;

  /// Create a new counter state with the given count
  const CounterState(this.count);

  @override
  List<Object> get props => [count];

  /// Create a copy of this state with the given count
  CounterState copyWith({int? count}) {
    return CounterState(count ?? this.count);
  }

  /// String representation of the state
  @override
  String toString() => 'CounterState(count: $count)';
}
