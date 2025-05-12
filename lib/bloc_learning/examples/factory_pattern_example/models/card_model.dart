import 'package:flutter/material.dart';

/// CardType enum
/// 
/// Defines the different types of cards available in the application.
enum CardType {
  info,
  warning,
  error,
  success,
}

/// CardModel
/// 
/// This class represents the data model for a card.
/// It contains all the properties needed to create a card.
class CardModel {
  final String title;
  final String content;
  final CardType type;
  final VoidCallback? onAction;
  final String? actionText;
  
  const CardModel({
    required this.title,
    required this.content,
    required this.type,
    this.onAction,
    this.actionText,
  });
  
  /// Get the color for this card based on its type
  Color get color {
    switch (type) {
      case CardType.info:
        return Colors.blue[50]!;
      case CardType.warning:
        return Colors.orange[50]!;
      case CardType.error:
        return Colors.red[50]!;
      case CardType.success:
        return Colors.green[50]!;
    }
  }
  
  /// Get the border color for this card based on its type
  Color get borderColor {
    switch (type) {
      case CardType.info:
        return Colors.blue[300]!;
      case CardType.warning:
        return Colors.orange[300]!;
      case CardType.error:
        return Colors.red[300]!;
      case CardType.success:
        return Colors.green[300]!;
    }
  }
  
  /// Get the icon for this card based on its type
  IconData get icon {
    switch (type) {
      case CardType.info:
        return Icons.info;
      case CardType.warning:
        return Icons.warning;
      case CardType.error:
        return Icons.error;
      case CardType.success:
        return Icons.check_circle;
    }
  }
  
  /// Get the icon color for this card based on its type
  Color get iconColor {
    switch (type) {
      case CardType.info:
        return Colors.blue;
      case CardType.warning:
        return Colors.orange;
      case CardType.error:
        return Colors.red;
      case CardType.success:
        return Colors.green;
    }
  }
}
