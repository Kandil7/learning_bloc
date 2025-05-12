import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../domain/button.dart';

/// Cupertino (iOS) button implementation
///
/// This class implements the Button interface for Cupertino (iOS) design.
/// It serves as a concrete product in the Factory Pattern.
class CupertinoButtonImpl implements Button {
  /// The text to display on the button
  final String text;
  
  /// The callback to execute when the button is pressed
  final VoidCallback onPressed;
  
  /// Create a new Cupertino button
  const CupertinoButtonImpl({
    required this.text,
    required this.onPressed,
  });
  
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      color: CupertinoColors.activeBlue,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
  
  @override
  String get name => 'Cupertino Button';
}
