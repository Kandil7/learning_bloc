import 'package:flutter/material.dart';
import 'package:learning_bloc/bloc_learning/examples/factory_pattern_example/models/button_model.dart';

/// AppButton Widget
/// 
/// This widget renders a button based on the provided ButtonModel.
/// It's a concrete implementation that will be created by the factory.
class AppButton extends StatelessWidget {
  final ButtonModel model;
  
  const AppButton({Key? key, required this.model}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: model.onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: model.color,
        foregroundColor: model.textColor,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (model.icon != null) ...[
            Icon(model.icon),
            const SizedBox(width: 8),
          ],
          Text(model.text),
        ],
      ),
    );
  }
}
