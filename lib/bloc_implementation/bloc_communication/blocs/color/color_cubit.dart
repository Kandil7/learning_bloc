import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../counter/counter_cubit.dart';
import 'color_state.dart';

/// Color Cubit
///
/// This Cubit manages the color state of the application.
/// It demonstrates BLoC-to-BLoC communication by listening to the CounterCubit.
class ColorCubit extends Cubit<ColorState> {
  final CounterCubit _counterCubit;
  late final StreamSubscription<int> _counterSubscription;

  /// Creates a new ColorCubit instance
  ///
  /// It takes a CounterCubit instance to listen to counter changes.
  ColorCubit({required CounterCubit counterCubit})
      : _counterCubit = counterCubit,
        super(const ColorState(color: Colors.blue)) {
    // Listen to the CounterCubit
    _counterSubscription = _counterCubit.stream.listen(_onCounterChanged);
  }

  /// Handle counter changes
  void _onCounterChanged(int count) {
    // Change color based on counter value
    if (count.isEven) {
      emit(const ColorState(color: Colors.blue));
    } else {
      emit(const ColorState(color: Colors.red));
    }
  }

  /// Set a specific color
  void setColor(Color color) {
    emit(ColorState(color: color));
  }

  @override
  Future<void> close() {
    _counterSubscription.cancel();
    return super.close();
  }
}

/// StreamSubscription type
typedef StreamSubscription<T> = Stream<T> Function();
