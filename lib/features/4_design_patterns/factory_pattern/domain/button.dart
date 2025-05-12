import 'package:flutter/material.dart';

/// Abstract button interface
///
/// This abstract class defines the interface for all button implementations.
/// It serves as the product interface in the Factory Pattern.
abstract class Button {
  /// Build the button widget
  ///
  /// This method should be implemented by concrete button classes
  /// to create the actual button widget.
  Widget build(BuildContext context);
  
  /// Get the button name
  ///
  /// This method should return the name of the button implementation.
  String get name;
}
