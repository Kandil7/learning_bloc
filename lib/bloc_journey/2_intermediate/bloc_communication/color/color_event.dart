import 'package:flutter/material.dart';

/// Events for the ColorBloc
///
/// These events represent color changes in the app.
sealed class ColorEvent {}

/// Event to change the color
class ChangeColor extends ColorEvent {
  final Color color;

  ChangeColor(this.color);
}

/// Event to change the color based on a counter value
///
/// This event is used for BLoC-to-BLoC communication.
class ChangeColorBasedOnCounter extends ColorEvent {
  final int counter;

  ChangeColorBasedOnCounter(this.counter);
}
