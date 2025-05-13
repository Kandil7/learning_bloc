import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// Theme State
///
/// This state represents the app theme.
class ThemeState extends Equatable {
  final ThemeMode themeMode;

  /// Constructor for ThemeState
  const ThemeState({required this.themeMode});

  @override
  List<Object?> get props => [themeMode];
}
