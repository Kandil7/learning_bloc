import 'package:flutter/material.dart';

/// Widget to display an explanation of the Factory Pattern
///
/// This widget provides a brief explanation of the Factory Pattern
/// and how it's implemented in this example.
class FactoryExplanation extends StatelessWidget {
  /// Create a new Factory Pattern explanation widget
  const FactoryExplanation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Factory Pattern Explained',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'The Factory Pattern is a creational design pattern that provides an interface for creating objects without specifying their concrete classes:',
            ),
            SizedBox(height: 8),
            Text('• Product Interface: Abstract class that defines the interface (Button)'),
            Text('• Concrete Products: Classes that implement the interface (MaterialButtonImpl, CupertinoButtonImpl)'),
            Text('• Factory: Class that creates products based on parameters (ButtonFactory)'),
            SizedBox(height: 8),
            Text(
              'In this example:',
            ),
            Text('• The ButtonFactory creates buttons based on the platform'),
            Text('• The buttons have the same interface but different implementations'),
            Text('• The client code doesn\'t need to know which button implementation is used'),
          ],
        ),
      ),
    );
  }
}
