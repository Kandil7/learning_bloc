import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'theme_state.dart';

/// Theme Cubit
///
/// This Cubit manages the theme state of the application.
class ThemeCubit extends Cubit<ThemeState> {
  /// Creates a new ThemeCubit instance with the default theme
  ThemeCubit() : super(const ThemeState(themeMode: ThemeMode.light));

  /// Toggle between light and dark theme
  void toggleTheme() {
    final newThemeMode = state.themeMode == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
    emit(ThemeState(themeMode: newThemeMode));
  }

  /// Set the theme mode
  void setThemeMode(ThemeMode themeMode) {
    emit(ThemeState(themeMode: themeMode));
  }
}
