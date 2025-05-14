# FlutterMastery

A comprehensive Flutter learning project that takes you from basic to advanced concepts, with a focus on BLoC pattern, clean architecture, and design patterns.

## Project Overview

FlutterMastery is designed as a structured learning path for Flutter development. It provides both theoretical explanations and practical examples to help you master Flutter development from the ground up.

## Learning Path

The project is organized into a progressive learning path:

### 1. Fundamentals
- Flutter basics
- Widgets and layouts
- Basic state management
- Simple counter app

### 2. State Management
- BLoC pattern introduction
- Cubit vs BLoC
- Stream basics
- Form validation with BLoC

### 3. Architecture
- Clean Architecture principles
- Repository pattern
- Dependency Injection
- Separation of concerns

### 4. Design Patterns
- Factory pattern: Creating objects without specifying their concrete classes
- Observer pattern: One-to-many dependency between objects with automatic notifications
- Singleton pattern
- Adapter pattern

### 5. UI Components
- Basic UI Components (Text, Image, Icon, Layout Widgets, Box Model, Constraints)
- Material Design (Components, Theming, Navigation Patterns, Form Components)
- Cupertino Design (iOS-style components, Platform-Adaptive Design, iOS Navigation)
- Responsive Design (MediaQuery, LayoutBuilder, Responsive Patterns, Adaptive Widgets)
- Advanced UI Techniques (Custom Animations, Custom Painting, Gesture Handling, Performance)

### 6. Real-World Applications
- REST API integration
- Network connectivity monitoring
- Todo list management
- Complete applications

## Key Features

- **Progressive Learning**: Start with basics and advance to complex concepts
- **Clean Architecture**: Learn best practices for organizing Flutter code
- **BLoC Pattern**: Master state management with the BLoC pattern
- **Design Patterns**: Implement common design patterns in Flutter
- **Detailed Documentation**: Comprehensive explanations and comments
- **Real-World Examples**: Practical applications of theoretical concepts

## Getting Started

1. Clone the repository
2. Run `flutter pub get` to install dependencies
3. Navigate to the learning dashboard to explore different concepts

```bash
git clone https://github.com/Kandil7/flutter_mastery.git
cd flutter_mastery
flutter pub get
flutter run
```

## Project Structure

The project follows a clean architecture approach with a feature-first organization:

```
lib/
├── core/                  # Core utilities and shared components
├── features/              # Feature modules organized by learning path
│   ├── 1_fundamentals/    # Beginner level concepts
│   ├── 2_state_management/# Intermediate level - State Management
│   ├── 3_architecture/    # Advanced level - Architecture
│   ├── 4_design_patterns/ # Design Patterns in Flutter
│   └── 5_real_world/      # Real-world applications
├── localization/          # Localization resources
└── main.dart              # Application entry point
```

For a detailed breakdown of the project structure, see [project_structure.md](project_structure.md).

## Key Concepts Covered

### BLoC Pattern
- Events, States, and BLoCs
- Cubit vs BLoC
- BLoC Observer
- BLoC Testing

### Clean Architecture
- Presentation Layer
- Domain Layer
- Data Layer
- Dependency Flow
- Use Cases

### Design Patterns
- Factory Pattern
- Observer Pattern
- Repository Pattern
- Dependency Injection

## Dependencies

- [flutter_bloc](https://pub.dev/packages/flutter_bloc): State management
- [get_it](https://pub.dev/packages/get_it): Dependency injection
- [equatable](https://pub.dev/packages/equatable): Value equality
- [dio](https://pub.dev/packages/dio): HTTP client
- [shared_preferences](https://pub.dev/packages/shared_preferences): Local storage
- [connectivity_plus](https://pub.dev/packages/connectivity_plus): Network connectivity

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
