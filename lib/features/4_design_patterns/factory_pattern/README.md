# Factory Pattern

This example demonstrates the Factory Pattern in Flutter.

## Learning Objectives

- Understand the Factory Pattern and its use cases
- Learn how to implement the Factory Pattern in Flutter
- Apply the Factory Pattern to create platform-specific UI components

## Key Concepts

### Factory Pattern

The Factory Pattern is a creational design pattern that provides an interface for creating objects without specifying their concrete classes. It allows a class to defer instantiation to subclasses.

### Types of Factory Patterns

1. **Simple Factory**: A static method that returns an instance of a class
2. **Factory Method**: A method in a class that creates objects
3. **Abstract Factory**: A class that creates families of related objects

### Benefits of Factory Pattern

- **Encapsulation**: Hides the creation logic from the client
- **Flexibility**: Makes it easy to add new product types
- **Decoupling**: Reduces dependencies between classes
- **Testability**: Makes code easier to test with mock objects

## Implementation

In this example, we implement a UI component factory that creates platform-specific UI components (Android/Material and iOS/Cupertino) based on the current platform.

### Product Interface

```dart
abstract class Button {
  Widget build(BuildContext context);
}
```

### Concrete Products

```dart
class MaterialButton implements Button {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text('Material Button'),
    );
  }
}

class CupertinoButton implements Button {
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {},
      child: Text('Cupertino Button'),
    );
  }
}
```

### Factory

```dart
class ButtonFactory {
  static Button createButton(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.android:
        return MaterialButton();
      case TargetPlatform.iOS:
        return CupertinoButton();
      default:
        return MaterialButton();
    }
  }
}
```

### Usage

```dart
final button = ButtonFactory.createButton(Theme.of(context).platform);
return button.build(context);
```

## Resources

- [Factory Pattern - Refactoring Guru](https://refactoring.guru/design-patterns/factory-method)
- [Design Patterns in Flutter](https://medium.com/flutter-community/design-patterns-in-flutter-part-1-factory-pattern-8d3bb83fad2c)
- [Flutter Platform Widgets](https://pub.dev/packages/flutter_platform_widgets)
