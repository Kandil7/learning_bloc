import 'package:flutter/material.dart';

/// Application theme configuration
/// 
/// This class provides the theme configuration for the application.
/// It includes light and dark themes, as well as custom colors and text styles.
class AppTheme {
  /// Primary color for the application
  static const Color primaryColor = Color(0xFF2196F3);
  
  /// Secondary color for the application
  static const Color secondaryColor = Color(0xFF03DAC6);
  
  /// Error color for the application
  static const Color errorColor = Color(0xFFB00020);
  
  /// Background color for the light theme
  static const Color lightBackgroundColor = Color(0xFFF5F5F5);
  
  /// Background color for the dark theme
  static const Color darkBackgroundColor = Color(0xFF121212);
  
  /// Text color for the light theme
  static const Color lightTextColor = Color(0xFF000000);
  
  /// Text color for the dark theme
  static const Color darkTextColor = Color(0xFFFFFFFF);
  
  /// Light theme for the application
  static final ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    colorScheme: const ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
      error: errorColor,
      background: lightBackgroundColor,
      onBackground: lightTextColor,
    ),
    scaffoldBackgroundColor: lightBackgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    cardTheme: CardTheme(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: lightTextColor,
      ),
      displayMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: lightTextColor,
      ),
      displaySmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: lightTextColor,
      ),
      headlineMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: lightTextColor,
      ),
      titleLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: lightTextColor,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: lightTextColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: lightTextColor,
      ),
    ),
  );
  
  /// Dark theme for the application
  static final ThemeData darkTheme = ThemeData(
    primaryColor: primaryColor,
    colorScheme: const ColorScheme.dark(
      primary: primaryColor,
      secondary: secondaryColor,
      error: errorColor,
      background: darkBackgroundColor,
      onBackground: darkTextColor,
    ),
    scaffoldBackgroundColor: darkBackgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    cardTheme: CardTheme(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: darkTextColor,
      ),
      displayMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: darkTextColor,
      ),
      displaySmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: darkTextColor,
      ),
      headlineMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: darkTextColor,
      ),
      titleLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: darkTextColor,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: darkTextColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: darkTextColor,
      ),
    ),
  );
}
