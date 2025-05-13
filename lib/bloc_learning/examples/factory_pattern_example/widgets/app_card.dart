import 'package:flutter/material.dart';
import 'package:flutter_mastery/bloc_learning/examples/factory_pattern_example/models/card_model.dart';

/// AppCard Widget
///
/// This widget renders a card based on the provided CardModel.
/// It's a concrete implementation that will be created by the factory.
class AppCard extends StatelessWidget {
  final CardModel model;

  const AppCard({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: model.borderColor),
      ),
      color: model.color,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(model.icon, color: model.iconColor),
                const SizedBox(width: 8),
                Text(
                  model.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(model.content),
            if (model.onAction != null && model.actionText != null) ...[
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: model.onAction,
                  child: Text(model.actionText!),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
