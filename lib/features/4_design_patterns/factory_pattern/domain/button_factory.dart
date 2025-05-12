import 'package:flutter/material.dart';
import '../data/cupertino_button.dart';
import '../data/material_button.dart';
import 'button.dart';

/// Button factory
///
/// This class is responsible for creating buttons based on the platform.
/// It serves as the factory in the Factory Pattern.
class ButtonFactory {
  /// Create a button based on the platform
  ///
  /// This method creates a button implementation based on the current platform.
  /// It returns a MaterialButtonImpl for Android and a CupertinoButtonImpl for iOS.
  static Button createButton({
    required TargetPlatform platform,
    required String text,
    required VoidCallback onPressed,
  }) {
    switch (platform) {
      case TargetPlatform.iOS:
        return CupertinoButtonImpl(
          text: text,
          onPressed: onPressed,
        );
      case TargetPlatform.android:
      default:
        return MaterialButtonImpl(
          text: text,
          onPressed: onPressed,
        );
    }
  }
  
  /// Create a Material button
  ///
  /// This method creates a MaterialButtonImpl regardless of the platform.
  static Button createMaterialButton({
    required String text,
    required VoidCallback onPressed,
  }) {
    return MaterialButtonImpl(
      text: text,
      onPressed: onPressed,
    );
  }
  
  /// Create a Cupertino button
  ///
  /// This method creates a CupertinoButtonImpl regardless of the platform.
  static Button createCupertinoButton({
    required String text,
    required VoidCallback onPressed,
  }) {
    return CupertinoButtonImpl(
      text: text,
      onPressed: onPressed,
    );
  }
}
