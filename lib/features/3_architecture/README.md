# Clean Architecture in Flutter

This section covers advanced architectural patterns for Flutter applications, with a focus on Clean Architecture.

## Learning Objectives

- Understand the principles of Clean Architecture
- Learn how to implement Clean Architecture in Flutter
- Master the Repository pattern
- Implement Dependency Injection

## Topics Covered

### 1. Clean Architecture Principles

- Separation of concerns
- Dependency rule
- Entities, Use Cases, and Interfaces
- Dependency inversion principle

### 2. Repository Pattern

- Data sources and repositories
- Repository interfaces
- Error handling
- Caching strategies

### 3. Dependency Injection

- Service locator pattern
- get_it package
- Dependency registration
- Testing with mocked dependencies

### 4. Clean Architecture Implementation

- Project structure
- Layer communication
- Error handling
- Testing strategies

## Key Concepts

### Clean Architecture Layers

Clean Architecture divides an application into layers, with dependencies pointing inward:

1. **Presentation Layer**: UI components, BLoCs, and widgets
2. **Domain Layer**: Business logic, entities, and use cases
3. **Data Layer**: Repositories, data sources, and models

```
lib/
├── presentation/
│   ├── pages/
│   ├── widgets/
│   └── bloc/
├── domain/
│   ├── entities/
│   ├── repositories/
│   └── usecases/
└── data/
    ├── repositories/
    ├── datasources/
    └── models/
```

### Repository Pattern

The Repository pattern provides a clean API for data access, abstracting the data sources:

```dart
// Repository interface in the domain layer
abstract class UserRepository {
  Future<Either<Failure, User>> getUser(int id);
  Future<Either<Failure, List<User>>> getAllUsers();
  Future<Either<Failure, void>> saveUser(User user);
}

// Repository implementation in the data layer
class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  UserRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, User>> getUser(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteUser = await remoteDataSource.getUser(id);
        localDataSource.cacheUser(remoteUser);
        return Right(remoteUser);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localUser = await localDataSource.getUser(id);
        return Right(localUser);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
  
  // Other methods...
}
```

### Dependency Injection

Dependency Injection helps manage dependencies and makes testing easier:

```dart
// Using get_it for dependency injection
final sl = GetIt.instance;

void init() {
  // BLoCs
  sl.registerFactory(() => UserBloc(getUser: sl()));
  
  // Use cases
  sl.registerLazySingleton(() => GetUser(repository: sl()));
  
  // Repositories
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  
  // Data sources
  sl.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(client: sl()),
  );
  sl.registerLazySingleton<UserLocalDataSource>(
    () => UserLocalDataSourceImpl(sharedPreferences: sl()),
  );
  
  // External
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => SharedPreferences.getInstance());
}
```

## Resources

- [Clean Architecture by Robert C. Martin](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- [Flutter Clean Architecture](https://resocoder.com/flutter-clean-architecture-tdd/)
- [get_it Package](https://pub.dev/packages/get_it)
- [dartz Package](https://pub.dev/packages/dartz)
