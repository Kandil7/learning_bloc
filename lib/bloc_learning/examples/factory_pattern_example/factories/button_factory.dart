import 'package:flutter/material.dart';
import 'package:learning_bloc/bloc_learning/examples/factory_pattern_example/models/button_model.dart';
import 'package:learning_bloc/bloc_learning/examples/factory_pattern_example/widgets/app_button.dart';

/// ButtonFactory
/// 
/// This class is responsible for creating buttons based on their type.
/// It encapsulates the button creation logic in one place.
class ButtonFactory {
  /// Create a primary button
  static AppButton createPrimaryButton({
    required String text,
    required VoidCallback onPressed,
    IconData? icon,
  }) {
    return AppButton(
      model: ButtonModel(
        text: text,
        onPressed: onPressed,
        type: ButtonType.primary,
        icon: icon,
      ),
    );
  }
  
  /// Create a secondary button
  static AppButton createSecondaryButton({
    required String text,
    required VoidCallback onPressed,
    IconData? icon,
  }) {
    return AppButton(
      model: ButtonModel(
        text: text,
        onPressed: onPressed,
        type: ButtonType.secondary,
        icon: icon,
      ),
    );
  }
  
  /// Create a danger button
  static AppButton createDangerButton({
    required String text,
    required VoidCallback onPressed,
    IconData? icon,
  }) {
    return AppButton(
      model: ButtonModel(
        text: text,
        onPressed: onPressed,
        type: ButtonType.danger,
        icon: icon,
      ),
    );
  }
  
  /// Create a success button
  static AppButton createSuccessButton({
    required String text,
    required VoidCallback onPressed,
    IconData? icon,
  }) {
    return AppButton(
      model: ButtonModel(
        text: text,
        onPressed: onPressed,
        type: ButtonType.success,
        icon: icon,
      ),
    );
  }
  
  /// Create a button based on its type
  static AppButton createButton({
    required String text,
    required VoidCallback onPressed,
    required ButtonType type,
    IconData? icon,
  }) {
    return AppButton(
      model: ButtonModel(
        text: text,
        onPressed: onPressed,
        type: type,
        icon: icon,
      ),
    );
  }
}
