import 'package:flutter/material.dart';
import '../domain/button.dart';

/// Material Design button implementation
///
/// This class implements the Button interface for Material Design.
/// It serves as a concrete product in the Factory Pattern.
class MaterialButtonImpl implements Button {
  /// The text to display on the button
  final String text;
  
  /// The callback to execute when the button is pressed
  final VoidCallback onPressed;
  
  /// Create a new Material button
  const MaterialButtonImpl({
    required this.text,
    required this.onPressed,
  });
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
  
  @override
  String get name => 'Material Button';
}
