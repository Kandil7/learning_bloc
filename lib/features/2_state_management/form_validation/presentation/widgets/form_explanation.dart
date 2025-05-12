import 'package:flutter/material.dart';

/// Widget to display an explanation of form validation with BLoC
class FormExplanation extends StatelessWidget {
  /// Create a new form explanation widget
  const FormExplanation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue[200]!),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Form Validation with BLoC',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 8),
          Text(
            'This example demonstrates how to use BLoC pattern for form validation:',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 4),
          Text('• Email must contain @ and . characters', style: TextStyle(fontSize: 14)),
          Text('• Password must be at least 6 characters', style: TextStyle(fontSize: 14)),
          Text('• Form submission is enabled only when all fields are valid', style: TextStyle(fontSize: 14)),
          Text('• BlocConsumer is used to show feedback on form submission', style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
