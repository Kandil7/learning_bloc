import 'package:flutter/material.dart';
import 'package:flutter_mastery/bloc_learning/examples/strategy_pattern_example/payment_strategy.dart';

/// PaymentScreen
///
/// This screen demonstrates the Strategy Pattern by allowing users to select
/// different payment strategies at runtime.
class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  // Create the payment context
  final PaymentContext _paymentContext = PaymentContext();
  
  // Available payment strategies
  late final List<PaymentStrategy> _strategies;
  
  // Selected strategy index
  int _selectedStrategyIndex = 0;
  
  // Amount to pay
  final TextEditingController _amountController = TextEditingController(text: '100.00');
  
  // Payment result
  String? _paymentResult;

  @override
  void initState() {
    super.initState();
    
    // Initialize payment strategies
    _strategies = [
      CreditCardStrategy(
        cardNumber: '4111111111111111',
        name: 'John Doe',
        expiryDate: '12/25',
        cvv: '123',
      ),
      PayPalStrategy(
        email: 'john.doe@example.com',
        password: 'password',
      ),
      ApplePayStrategy(
        deviceId: 'iPhone12,1',
      ),
      BankTransferStrategy(
        accountNumber: '9876543210',
        bankName: 'Example Bank',
      ),
    ];
    
    // Set initial strategy
    _paymentContext.setPaymentStrategy(_strategies[_selectedStrategyIndex]);
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Strategy Pattern - Payment'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildExplanation(),
            const SizedBox(height: 24),
            _buildPaymentForm(),
            const SizedBox(height: 24),
            if (_paymentResult != null) _buildPaymentResult(),
          ],
        ),
      ),
    );
  }

  Widget _buildExplanation() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.green[200]!),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Strategy Pattern',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 8),
          Text(
            'This example demonstrates the Strategy Pattern:',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 4),
          Text('• Defines a family of algorithms (payment methods)',
              style: TextStyle(fontSize: 14)),
          Text('• Encapsulates each algorithm in separate classes',
              style: TextStyle(fontSize: 14)),
          Text('• Makes them interchangeable at runtime',
              style: TextStyle(fontSize: 14)),
          Text('• Decouples the client from the implementation details',
              style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildPaymentForm() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Payment Details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Select Payment Method:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            _buildPaymentMethodSelector(),
            const SizedBox(height: 16),
            TextField(
              controller: _amountController,
              decoration: const InputDecoration(
                labelText: 'Amount',
                prefixIcon: Icon(Icons.attach_money),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _processPayment,
                icon: const Icon(Icons.payment),
                label: const Text('PAY NOW'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethodSelector() {
    return Column(
      children: List.generate(_strategies.length, (index) {
        final strategy = _strategies[index];
        return RadioListTile<int>(
          title: Text(strategy.getName()),
          subtitle: Text(strategy.getDescription()),
          secondary: Icon(_getIconData(strategy.getIcon())),
          value: index,
          groupValue: _selectedStrategyIndex,
          onChanged: (value) {
            setState(() {
              _selectedStrategyIndex = value!;
              _paymentContext.setPaymentStrategy(_strategies[_selectedStrategyIndex]);
            });
          },
        );
      }),
    );
  }

  IconData _getIconData(String icon) {
    switch (icon) {
      case 'credit_card':
        return Icons.credit_card;
      case 'paypal':
        return Icons.payment;
      case 'apple':
        return Icons.apple;
      case 'account_balance':
        return Icons.account_balance;
      default:
        return Icons.payment;
    }
  }

  void _processPayment() {
    try {
      final amount = double.tryParse(_amountController.text) ?? 0.0;
      if (amount <= 0) {
        _showErrorSnackBar('Please enter a valid amount');
        return;
      }
      
      final result = _paymentContext.executePayment(amount);
      setState(() {
        _paymentResult = result;
      });
    } catch (e) {
      _showErrorSnackBar(e.toString());
    }
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  Widget _buildPaymentResult() {
    return Card(
      color: Colors.green[50],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.check_circle, color: Colors.green),
                SizedBox(width: 8),
                Text(
                  'Payment Result',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Divider(),
            const SizedBox(height: 8),
            Text(
              _paymentResult!,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'Strategy Pattern in Action:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'The payment was processed using the ${_strategies[_selectedStrategyIndex].getName()} strategy. '
              'You can change the strategy at runtime without changing the payment context.',
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}