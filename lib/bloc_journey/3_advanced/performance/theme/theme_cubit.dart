import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/performance/theme/theme_state.dart';

/// Theme Cubit
///
/// This Cubit manages the app theme.
class ThemeCubit extends Cubit<ThemeState> {
  /// Initialize the Cubit with an initial state
  ThemeCubit() : super(const ThemeState(themeMode: ThemeMode.light));

  /// Toggle the theme between light and dark
  void toggleTheme() {
    final newThemeMode = state.themeMode == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
    emit(ThemeState(themeMode: newThemeMode));
  }

  /// Set the theme to light
  void setLightTheme() {
    emit(const ThemeState(themeMode: ThemeMode.light));
  }

  /// Set the theme to dark
  void setDarkTheme() {
    emit(const ThemeState(themeMode: ThemeMode.dark));
  }

  /// Set the theme to system
  void setSystemTheme() {
    emit(const ThemeState(themeMode: ThemeMode.system));
  }
}
