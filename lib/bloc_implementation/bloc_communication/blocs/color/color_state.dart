import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// Color State
///
/// This class represents the state of the application color.
class ColorState extends Equatable {
  /// The current color
  final Color color;

  /// Creates a new ColorState instance
  const ColorState({required this.color});

  @override
  List<Object> get props => [color];
}
