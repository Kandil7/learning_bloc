// Singleton Pattern Example

import 'package:flutter/material.dart';

/// ThemeManager
///
/// A singleton class that manages the application theme.
/// This demonstrates the Singleton pattern where only one instance
/// of the class can exist throughout the application lifecycle.
class ThemeManager {
  // Private static instance variable
  static ThemeManager? _instance;
  
  // Theme data
  ThemeData _currentTheme = ThemeData.light();
  bool _isDarkMode = false;
  
  // Private constructor
  ThemeManager._();
  
  // Factory constructor that returns the singleton instance
  factory ThemeManager() {
    // Create the instance if it doesn't exist
    _instance ??= ThemeManager._();
    return _instance!;
  }
  
  // Getter for current theme
  ThemeData get currentTheme => _currentTheme;
  
  // Getter for dark mode status
  bool get isDarkMode => _isDarkMode;
  
  // Toggle between light and dark themes
  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    _currentTheme = _isDarkMode ? ThemeData.dark() : ThemeData.light();
  }
  
  // Set specific theme
  void setTheme(ThemeData theme) {
    _currentTheme = theme;
    _isDarkMode = theme.brightness == Brightness.dark;
  }
  
  // Set color scheme
  void setColorScheme(ColorScheme colorScheme) {
    _currentTheme = _currentTheme.copyWith(
      colorScheme: colorScheme,
    );
  }
  
  // Set primary color
  void setPrimaryColor(Color color) {
    _currentTheme = _currentTheme.copyWith(
      primaryColor: color,
      colorScheme: _currentTheme.colorScheme.copyWith(primary: color),
    );
  }
  
  // Reset to default theme
  void resetToDefault() {
    _currentTheme = ThemeData.light();
    _isDarkMode = false;
  }
}