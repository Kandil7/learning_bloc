# Clean Architecture with BLoC Pattern

This example demonstrates how to implement Clean Architecture with the BLoC pattern in Flutter applications.

## What is Clean Architecture?

Clean Architecture is a software design philosophy that separates the elements of a design into ring levels. The main rule of clean architecture is that code dependencies can only point inwards. This means that inner layers should not know anything about outer layers.

## Layers of Clean Architecture

### 1. Domain Layer

The innermost layer contains business logic and rules. It has no dependencies on any other layers.

- **Entities**: Enterprise-wide business rules and objects
- **Use Cases**: Application-specific business rules
- **Repository Interfaces**: Abstract definitions of data operations

### 2. Data Layer

The data layer implements repositories defined in the domain layer.

- **Repositories Implementation**: Concrete implementations of domain repositories
- **Data Sources**: Remote (API) and local (database) data sources
- **Models**: Data models that map to entities in the domain layer

### 3. Presentation Layer

The outermost layer that interacts with the UI.

- **BLoC**: Manages state and business logic for the UI
- **Pages**: Screen layouts and navigation
- **Widgets**: Reusable UI components

## Benefits of Clean Architecture

1. **Separation of Concerns**: Each layer has a specific responsibility
2. **Testability**: Business logic can be tested independently of UI and external dependencies
3. **Maintainability**: Changes in one layer don't affect other layers
4. **Scalability**: Easy to add new features without modifying existing code
5. **Framework Independence**: Core business logic doesn't depend on Flutter or any external framework

## Implementation in this Example

In this Weather App example, we'll implement:

1. **Domain Layer**:
   - Weather entity
   - WeatherRepository interface
   - GetWeather use case

2. **Data Layer**:
   - WeatherRepositoryImpl implementation
   - WeatherRemoteDataSource for API calls
   - WeatherModel that extends the Weather entity

3. **Presentation Layer**:
   - WeatherBloc for state management
   - WeatherPage for displaying weather information
   - Various widgets for UI components

## Flow of Control

1. User interacts with the UI (Presentation Layer)
2. UI triggers events in the BLoC (Presentation Layer)
3. BLoC calls use cases (Domain Layer)
4. Use cases call repository interfaces (Domain Layer)
5. Repository implementations fetch data from data sources (Data Layer)
6. Data flows back through the layers, transforming as needed
7. UI updates based on new state from BLoC (Presentation Layer)

This architecture ensures a clean separation of concerns and makes the codebase more maintainable and testable.
