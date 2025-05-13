import 'package:flutter_bloc/flutter_bloc.dart';

/// A simple counter Cubit that manages an integer state
///
/// This is the simplest form of state management using the BLoC pattern.
/// Cubit is a simplified version of BLoC that doesn't use events.
class CounterCubit extends Cubit<int> {
  /// Initialize the Cubit with an initial state of 0
  ///
  /// The super(0) call passes the initial state to the parent Cubit class
  CounterCubit() : super(0);

  /// Increment the counter by 1
  ///
  /// The emit method is used to emit a new state
  /// In this case, we're emitting the current state + 1
  void increment() => emit(state + 1);

  /// Decrement the counter by 1
  ///
  /// The emit method is used to emit a new state
  /// In this case, we're emitting the current state - 1
  void decrement() => emit(state - 1);

  /// Reset the counter to 0
  ///
  /// The emit method is used to emit a new state
  /// In this case, we're emitting 0
  void reset() => emit(0);
}
