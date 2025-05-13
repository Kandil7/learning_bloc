import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// Theme State
///
/// This class represents the state of the application theme.
class ThemeState extends Equatable {
  /// The current theme mode
  final ThemeMode themeMode;

  /// Creates a new ThemeState instance
  const ThemeState({required this.themeMode});

  @override
  List<Object> get props => [themeMode];
}
