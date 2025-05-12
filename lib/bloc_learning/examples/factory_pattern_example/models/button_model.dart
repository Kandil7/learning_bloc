import 'package:flutter/material.dart';

/// ButtonType enum
/// 
/// Defines the different types of buttons available in the application.
enum ButtonType {
  primary,
  secondary,
  danger,
  success,
}

/// ButtonModel
/// 
/// This class represents the data model for a button.
/// It contains all the properties needed to create a button.
class ButtonModel {
  final String text;
  final VoidCallback onPressed;
  final ButtonType type;
  final IconData? icon;
  
  const ButtonModel({
    required this.text,
    required this.onPressed,
    required this.type,
    this.icon,
  });
  
  /// Get the color for this button based on its type
  Color get color {
    switch (type) {
      case ButtonType.primary:
        return Colors.blue;
      case ButtonType.secondary:
        return Colors.grey;
      case ButtonType.danger:
        return Colors.red;
      case ButtonType.success:
        return Colors.green;
    }
  }
  
  /// Get the text color for this button based on its type
  Color get textColor {
    switch (type) {
      case ButtonType.primary:
      case ButtonType.danger:
      case ButtonType.success:
        return Colors.white;
      case ButtonType.secondary:
        return Colors.black87;
    }
  }
}
