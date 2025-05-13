# Strategy Pattern Example

## Overview

This example demonstrates the implementation of the Strategy Pattern in a Flutter application. The Strategy Pattern defines a family of algorithms, encapsulates each one, and makes them interchangeable. It lets the algorithm vary independently from clients that use it.

## Key Components

### 1. Strategy Interface

The `PaymentStrategy` interface defines the contract that all concrete strategies must follow:

```dart
abstract class PaymentStrategy {
  String pay(double amount);
  String getName();
  String getDescription();
  String getIcon();
}
```

### 2. Concrete Strategies

Multiple concrete implementations of the strategy interface:

- **CreditCardStrategy**: Processes payments via credit card
- **PayPalStrategy**: Processes payments via PayPal
- **ApplePayStrategy**: Processes payments via Apple Pay
- **BankTransferStrategy**: Processes payments via bank transfer

### 3. Context

The `PaymentContext` class maintains a reference to a strategy object and delegates the work to it:

```dart
class PaymentContext {
  PaymentStrategy? _strategy;

  void setPaymentStrategy(PaymentStrategy strategy) {
    _strategy = strategy;
  }

  String executePayment(double amount) {
    if (_strategy == null) {
      throw Exception("Payment strategy not set");
    }
    return _strategy!.pay(amount);
  }
}
```

### 4. UI Implementation

The `PaymentScreen` demonstrates how to use the Strategy pattern by allowing users to select different payment methods at runtime.

## Benefits of Strategy Pattern

1. **Flexibility**: Algorithms can be selected at runtime
2. **Encapsulation**: Each algorithm is encapsulated in its own class
3. **Interchangeability**: Strategies can be swapped without affecting the client
4. **Open/Closed Principle**: New strategies can be added without modifying existing code
5. **Elimination of Conditional Statements**: Replaces complex conditionals with polymorphism

## When to Use

Use the Strategy Pattern when:

- You need different variants of an algorithm
- You want to avoid exposing complex algorithm-specific data structures
- You have a class with many conditional statements that switch between different behaviors
- You want to isolate the algorithm from the code that uses it

## Common Use Cases in Flutter

1. **Payment Processing**: Different payment methods (as demonstrated)
2. **Sorting Algorithms**: Different ways to sort data
3. **Authentication Methods**: Different ways to authenticate users
4. **Navigation Strategies**: Different navigation patterns based on device or user preferences
5. **Rendering Strategies**: Different ways to render UI components

## Implementation in Flutter Context

In Flutter, the Strategy Pattern is particularly useful for:

1. **Form Validation**: Different validation strategies for different form fields
2. **Animation Strategies**: Different animation behaviors
3. **Data Fetching**: Different strategies for fetching data (network, cache, local)
4. **UI Adaptation**: Different UI strategies based on screen size or orientation

## Integration with BLoC

The Strategy Pattern can be integrated with BLoC by:

1. **Strategy Selection Events**: BLoC can handle events to change strategies
2. **Strategy Execution**: BLoC can execute the selected strategy
3. **State Management**: BLoC can manage the state of the selected strategy

This creates a powerful combination where BLoC manages the application state and the Strategy Pattern provides flexible algorithm selection.