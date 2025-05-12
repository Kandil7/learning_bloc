# Dependency Injection with get_it

This example demonstrates how to implement dependency injection in Flutter applications using the get_it package.

## What is Dependency Injection?

Dependency Injection (DI) is a design pattern that allows us to remove hard-coded dependencies and make our code loosely coupled, more maintainable, and easier to test. Instead of creating dependencies inside a class, dependencies are "injected" from the outside.

## Why Use Dependency Injection?

1. **Testability**: Makes it easy to replace real implementations with mocks for testing
2. **Maintainability**: Reduces coupling between components
3. **Scalability**: Makes it easier to add new features or change existing ones
4. **Reusability**: Promotes reuse of code across the application

## get_it Service Locator

get_it is a simple service locator for Dart and Flutter projects. It allows you to register implementations and then get them from anywhere in your code.

### Key Features of get_it:

1. **Simplicity**: Easy to understand and use
2. **Performance**: Very fast (O(1)) lookups
3. **Flexibility**: Supports different registration types (singleton, factory, lazy singleton)
4. **No Reflection**: Doesn't use reflection, which is important for performance

## Implementation in this Example

In this example, we'll implement a simple task management app with dependency injection:

1. **Service Layer**:
   - TaskService: Provides methods to manage tasks

2. **Repository Layer**:
   - TaskRepository: Abstracts data access for tasks

3. **BLoC Layer**:
   - TaskBloc: Manages state for tasks

4. **Dependency Injection**:
   - ServiceLocator: Configures and provides access to all dependencies

## Registration Types in get_it

1. **registerSingleton**: Creates an instance immediately and always returns the same instance
   ```dart
   getIt.registerSingleton<TaskRepository>(TaskRepositoryImpl());
   ```

2. **registerLazySingleton**: Creates an instance only when it's first requested
   ```dart
   getIt.registerLazySingleton<TaskService>(() => TaskServiceImpl(getIt<TaskRepository>()));
   ```

3. **registerFactory**: Creates a new instance each time it's requested
   ```dart
   getIt.registerFactory<TaskBloc>(() => TaskBloc(getIt<TaskService>()));
   ```

## Benefits Demonstrated

1. **Centralized Dependencies**: All dependencies are configured in one place
2. **Simplified Component Creation**: Components don't need to know how to create their dependencies
3. **Easy Testing**: Dependencies can be easily replaced with mocks
4. **Clean Architecture Support**: Supports separation of concerns and clean architecture

## Flow of Control

1. App initializes the ServiceLocator at startup
2. Components request dependencies from ServiceLocator instead of creating them
3. ServiceLocator provides the appropriate implementations
4. Components use the injected dependencies without knowing their concrete implementations
