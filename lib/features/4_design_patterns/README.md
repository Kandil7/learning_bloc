# Design Patterns in Flutter

This section covers common design patterns and their implementation in Flutter applications.

## Learning Objectives

- Understand common design patterns and their use cases
- Learn how to implement design patterns in Flutter
- Apply design patterns to solve real-world problems
- Improve code quality and maintainability

## Topics Covered

### 1. Factory Pattern

- Creating objects without specifying the exact class
- Abstract factories
- Factory methods
- Implementation in Flutter

### 2. Observer Pattern

- Defining a one-to-many dependency between objects
- Subject and observer interfaces
- Event handling
- Implementation with streams

### 3. Singleton Pattern

- Ensuring a class has only one instance
- Global access point
- Lazy initialization
- Thread safety considerations

### 4. Adapter Pattern

- Converting the interface of a class into another interface
- Making incompatible interfaces work together
- Implementation in Flutter

## Key Concepts

### Factory Pattern

The Factory Pattern provides an interface for creating objects without specifying their concrete classes:

```dart
// Abstract product
abstract class Button {
  Widget build(BuildContext context);
}

// Concrete products
class AndroidButton implements Button {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Text('Android Button'),
      onPressed: () {},
    );
  }
}

class IOSButton implements Button {
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Text('iOS Button'),
      onPressed: () {},
    );
  }
}

// Factory
class ButtonFactory {
  static Button createButton(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.android:
        return AndroidButton();
      case TargetPlatform.iOS:
        return IOSButton();
      default:
        return AndroidButton();
    }
  }
}

// Usage
Widget buildButton(BuildContext context) {
  final button = ButtonFactory.createButton(Theme.of(context).platform);
  return button.build(context);
}
```

### Observer Pattern

The Observer Pattern defines a one-to-many dependency between objects:

```dart
// Subject interface
abstract class Subject {
  void registerObserver(Observer observer);
  void removeObserver(Observer observer);
  void notifyObservers();
}

// Observer interface
abstract class Observer {
  void update(dynamic data);
}

// Concrete subject
class DataSubject implements Subject {
  final List<Observer> _observers = [];
  dynamic _data;

  dynamic get data => _data;

  set data(dynamic newData) {
    _data = newData;
    notifyObservers();
  }

  @override
  void registerObserver(Observer observer) {
    _observers.add(observer);
  }

  @override
  void removeObserver(Observer observer) {
    _observers.remove(observer);
  }

  @override
  void notifyObservers() {
    for (var observer in _observers) {
      observer.update(_data);
    }
  }
}

// Concrete observer
class DataObserver implements Observer {
  final Function(dynamic) onDataChanged;

  DataObserver(this.onDataChanged);

  @override
  void update(dynamic data) {
    onDataChanged(data);
  }
}

// Usage
final subject = DataSubject();
final observer = DataObserver((data) {
  print('Data changed: $data');
});

subject.registerObserver(observer);
subject.data = 'New data'; // Prints: Data changed: New data
```

### Singleton Pattern

The Singleton Pattern ensures a class has only one instance:

```dart
class AppSettings {
  // Private constructor
  AppSettings._();

  // Singleton instance
  static final AppSettings _instance = AppSettings._();

  // Factory constructor to return the instance
  factory AppSettings() => _instance;

  // Settings
  bool darkMode = false;
  String language = 'en';

  // Methods
  void toggleDarkMode() {
    darkMode = !darkMode;
  }

  void setLanguage(String lang) {
    language = lang;
  }
}

// Usage
final settings = AppSettings();
settings.toggleDarkMode();
print(settings.darkMode); // true

final sameSettings = AppSettings();
print(sameSettings.darkMode); // true (same instance)
```

## Resources

- [Design Patterns: Elements of Reusable Object-Oriented Software](https://www.amazon.com/Design-Patterns-Elements-Reusable-Object-Oriented/dp/0201633612)
- [Flutter Design Patterns](https://flutterdesignpatterns.com/)
- [Dart Design Patterns](https://dart.dev/guides/language/effective-dart)
- [Refactoring Guru: Design Patterns](https://refactoring.guru/design-patterns)
