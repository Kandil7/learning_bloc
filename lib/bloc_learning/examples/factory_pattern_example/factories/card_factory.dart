import 'package:flutter/material.dart';
import 'package:flutter_mastery/bloc_learning/examples/factory_pattern_example/models/card_model.dart';
import 'package:flutter_mastery/bloc_learning/examples/factory_pattern_example/widgets/app_card.dart';

/// CardFactory
///
/// This class is responsible for creating cards based on their type.
/// It encapsulates the card creation logic in one place.
class CardFactory {
  /// Create an info card
  static AppCard createInfoCard({
    required String title,
    required String content,
    VoidCallback? onAction,
    String? actionText,
  }) {
    return AppCard(
      model: CardModel(
        title: title,
        content: content,
        type: CardType.info,
        onAction: onAction,
        actionText: actionText,
      ),
    );
  }

  /// Create a warning card
  static AppCard createWarningCard({
    required String title,
    required String content,
    VoidCallback? onAction,
    String? actionText,
  }) {
    return AppCard(
      model: CardModel(
        title: title,
        content: content,
        type: CardType.warning,
        onAction: onAction,
        actionText: actionText,
      ),
    );
  }

  /// Create an error card
  static AppCard createErrorCard({
    required String title,
    required String content,
    VoidCallback? onAction,
    String? actionText,
  }) {
    return AppCard(
      model: CardModel(
        title: title,
        content: content,
        type: CardType.error,
        onAction: onAction,
        actionText: actionText,
      ),
    );
  }

  /// Create a success card
  static AppCard createSuccessCard({
    required String title,
    required String content,
    VoidCallback? onAction,
    String? actionText,
  }) {
    return AppCard(
      model: CardModel(
        title: title,
        content: content,
        type: CardType.success,
        onAction: onAction,
        actionText: actionText,
      ),
    );
  }

  /// Create a card based on its type
  static AppCard createCard({
    required String title,
    required String content,
    required CardType type,
    VoidCallback? onAction,
    String? actionText,
  }) {
    return AppCard(
      model: CardModel(
        title: title,
        content: content,
        type: type,
        onAction: onAction,
        actionText: actionText,
      ),
    );
  }
}
