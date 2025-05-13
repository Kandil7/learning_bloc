import 'package:equatable/equatable.dart';

/// Counter State
///
/// This state represents the counter value.
class CounterState extends Equatable {
  final int count;

  /// Constructor for CounterState
  const CounterState({required this.count});

  @override
  List<Object?> get props => [count];
}
