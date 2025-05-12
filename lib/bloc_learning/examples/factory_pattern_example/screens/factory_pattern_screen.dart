import 'package:flutter/material.dart';
import 'package:learning_bloc/bloc_learning/examples/factory_pattern_example/factories/button_factory.dart';
import 'package:learning_bloc/bloc_learning/examples/factory_pattern_example/factories/card_factory.dart';
import 'package:learning_bloc/bloc_learning/examples/factory_pattern_example/models/button_model.dart';
import 'package:learning_bloc/bloc_learning/examples/factory_pattern_example/models/card_model.dart';

/// FactoryPatternScreen
/// 
/// This screen demonstrates the Factory Pattern by showing different
/// UI components created by factories.
class FactoryPatternScreen extends StatelessWidget {
  const FactoryPatternScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Factory Pattern Example'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildExplanation(),
            const SizedBox(height: 24),
            _buildButtonSection(context),
            const SizedBox(height: 24),
            _buildCardSection(context),
          ],
        ),
      ),
    );
  }
  
  Widget _buildExplanation() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.amber[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.amber[200]!),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Factory Pattern',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 8),
          Text(
            'This example demonstrates the Factory Pattern:',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 4),
          Text('• Factories encapsulate object creation logic', style: TextStyle(fontSize: 14)),
          Text('• Client code doesn\'t need to know implementation details', style: TextStyle(fontSize: 14)),
          Text('• Consistent styling across the application', style: TextStyle(fontSize: 14)),
          Text('• Easy to add new component types without changing client code', style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
  
  Widget _buildButtonSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Buttons',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
          'These buttons are created using ButtonFactory:',
          style: TextStyle(fontSize: 14),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            // Using specific factory methods
            ButtonFactory.createPrimaryButton(
              text: 'Primary',
              onPressed: () => _showSnackBar(context, 'Primary button pressed'),
              icon: Icons.star,
            ),
            ButtonFactory.createSecondaryButton(
              text: 'Secondary',
              onPressed: () => _showSnackBar(context, 'Secondary button pressed'),
            ),
            ButtonFactory.createDangerButton(
              text: 'Danger',
              onPressed: () => _showSnackBar(context, 'Danger button pressed'),
              icon: Icons.warning,
            ),
            ButtonFactory.createSuccessButton(
              text: 'Success',
              onPressed: () => _showSnackBar(context, 'Success button pressed'),
              icon: Icons.check,
            ),
            
            // Using generic factory method
            ButtonFactory.createButton(
              text: 'Generic Primary',
              onPressed: () => _showSnackBar(context, 'Generic primary button pressed'),
              type: ButtonType.primary,
            ),
          ],
        ),
      ],
    );
  }
  
  Widget _buildCardSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Cards',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
          'These cards are created using CardFactory:',
          style: TextStyle(fontSize: 14),
        ),
        const SizedBox(height: 16),
        
        // Using specific factory methods
        CardFactory.createInfoCard(
          title: 'Information',
          content: 'This is an information card created by CardFactory.createInfoCard().',
          actionText: 'Learn More',
          onAction: () => _showSnackBar(context, 'Info action pressed'),
        ),
        const SizedBox(height: 8),
        CardFactory.createWarningCard(
          title: 'Warning',
          content: 'This is a warning card created by CardFactory.createWarningCard().',
          actionText: 'Acknowledge',
          onAction: () => _showSnackBar(context, 'Warning action pressed'),
        ),
        const SizedBox(height: 8),
        CardFactory.createErrorCard(
          title: 'Error',
          content: 'This is an error card created by CardFactory.createErrorCard().',
          actionText: 'Retry',
          onAction: () => _showSnackBar(context, 'Error action pressed'),
        ),
        const SizedBox(height: 8),
        CardFactory.createSuccessCard(
          title: 'Success',
          content: 'This is a success card created by CardFactory.createSuccessCard().',
          actionText: 'Continue',
          onAction: () => _showSnackBar(context, 'Success action pressed'),
        ),
        const SizedBox(height: 8),
        
        // Using generic factory method
        CardFactory.createCard(
          title: 'Generic Card',
          content: 'This is a generic card created by CardFactory.createCard().',
          type: CardType.info,
          actionText: 'OK',
          onAction: () => _showSnackBar(context, 'Generic card action pressed'),
        ),
      ],
    );
  }
  
  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
