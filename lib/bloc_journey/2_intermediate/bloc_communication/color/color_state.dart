import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// State for the ColorBloc
///
/// This state contains the current color.
class ColorState extends Equatable {
  final Color color;

  /// Constructor for ColorState
  const ColorState({required this.color});

  /// Initial state for the color
  ///
  /// The initial color is blue.
  factory ColorState.initial() {
    return const ColorState(color: Colors.blue);
  }

  /// Create a copy of this state with the given parameters
  ColorState copyWith({Color? color}) {
    return ColorState(color: color ?? this.color);
  }

  @override
  List<Object?> get props => [color];
}
