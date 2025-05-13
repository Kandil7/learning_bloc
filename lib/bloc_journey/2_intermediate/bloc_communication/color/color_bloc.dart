import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mastery/bloc_journey/2_intermediate/bloc_communication/color/color_event.dart';
import 'package:flutter_mastery/bloc_journey/2_intermediate/bloc_communication/color/color_state.dart';

/// BLoC for color management
///
/// This BLoC handles color changes, including changes based on counter values.
class ColorBloc extends Bloc<ColorEvent, ColorState> {
  /// Initialize the BLoC with the initial state
  ColorBloc() : super(ColorState.initial()) {
    // Register event handlers
    on<ChangeColor>(_onChangeColor);
    on<ChangeColorBasedOnCounter>(_onChangeColorBasedOnCounter);
  }

  /// Handle the change color event
  void _onChangeColor(ChangeColor event, Emitter<ColorState> emit) {
    emit(state.copyWith(color: event.color));
  }

  /// Handle the change color based on counter event
  ///
  /// This method changes the color based on the counter value:
  /// - Even numbers: Green
  /// - Odd numbers: Red
  /// - Multiples of 5: Purple
  /// - Zero: Blue
  void _onChangeColorBasedOnCounter(
      ChangeColorBasedOnCounter event, Emitter<ColorState> emit) {
    final counter = event.counter;
    
    Color newColor;
    
    if (counter == 0) {
      newColor = Colors.blue;
    } else if (counter % 5 == 0) {
      newColor = Colors.purple;
    } else if (counter % 2 == 0) {
      newColor = Colors.green;
    } else {
      newColor = Colors.red;
    }
    
    emit(state.copyWith(color: newColor));
  }
}
