// Strategy Pattern Example

/// PaymentStrategy
///
/// Interface for different payment strategies.
abstract class PaymentStrategy {
  String pay(double amount);
  String getName();
  String getDescription();
  String getIcon();
}

/// CreditCardStrategy
///
/// Concrete strategy for credit card payments.
class CreditCardStrategy implements PaymentStrategy {
  final String cardNumber;
  final String name;
  final String expiryDate;
  final String cvv;

  CreditCardStrategy({
    required this.cardNumber,
    required this.name,
    required this.expiryDate,
    required this.cvv,
  });

  @override
  String pay(double amount) {
    return "Paid \$$amount using Credit Card ending with ${cardNumber.substring(cardNumber.length - 4)}";
  }

  @override
  String getName() => "Credit Card";

  @override
  String getDescription() => "Pay securely with your credit card";

  @override
  String getIcon() => "credit_card";
}

/// PayPalStrategy
///
/// Concrete strategy for PayPal payments.
class PayPalStrategy implements PaymentStrategy {
  final String email;
  final String password;

  PayPalStrategy({
    required this.email,
    required this.password,
  });

  @override
  String pay(double amount) {
    return "Paid \$$amount using PayPal account $email";
  }

  @override
  String getName() => "PayPal";

  @override
  String getDescription() => "Fast and secure payment with PayPal";

  @override
  String getIcon() => "paypal";
}

/// ApplePayStrategy
///
/// Concrete strategy for Apple Pay payments.
class ApplePayStrategy implements PaymentStrategy {
  final String deviceId;

  ApplePayStrategy({
    required this.deviceId,
  });

  @override
  String pay(double amount) {
    return "Paid \$$amount using Apple Pay on device $deviceId";
  }

  @override
  String getName() => "Apple Pay";

  @override
  String getDescription() => "Quick and secure payment with Apple Pay";

  @override
  String getIcon() => "apple";
}

/// BankTransferStrategy
///
/// Concrete strategy for bank transfer payments.
class BankTransferStrategy implements PaymentStrategy {
  final String accountNumber;
  final String bankName;

  BankTransferStrategy({
    required this.accountNumber,
    required this.bankName,
  });

  @override
  String pay(double amount) {
    return "Paid \$$amount using Bank Transfer from $bankName account ending with ${accountNumber.substring(accountNumber.length - 4)}";
  }

  @override
  String getName() => "Bank Transfer";

  @override
  String getDescription() => "Direct transfer from your bank account";

  @override
  String getIcon() => "account_balance";
}

/// PaymentContext
///
/// Context class that uses a payment strategy.
class PaymentContext {
  PaymentStrategy? _strategy;

  // Setter for the strategy
  void setPaymentStrategy(PaymentStrategy strategy) {
    _strategy = strategy;
  }

  // Execute payment using the selected strategy
  String executePayment(double amount) {
    if (_strategy == null) {
      throw Exception("Payment strategy not set");
    }
    return _strategy!.pay(amount);
  }

  // Get the current strategy
  PaymentStrategy? getStrategy() {
    return _strategy;
  }
}