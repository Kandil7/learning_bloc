# Clean Architecture Example

This example demonstrates how to implement Clean Architecture in a Flutter application. It shows how to separate the application into layers and how to use dependency injection to connect them.

## What is Clean Architecture?

Clean Architecture is a software design philosophy that separates the elements of a design into ring levels. The main rule of clean architecture is that code dependencies can only come from outer levels inward.

## Benefits of Clean Architecture

1. **Separation of Concerns**: Each layer has a specific responsibility
2. **Testability**: Business logic can be tested independently of UI and external dependencies
3. **Maintainability**: Changes in one layer don't affect other layers
4. **Scalability**: Easy to add new features without modifying existing code
5. **Framework Independence**: Core business logic doesn't depend on Flutter or any external framework

## Implementation in this Example

In this Weather App example, we implement:

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

## Code Structure

```
clean_architecture/
├── data/
│   ├── datasources/
│   │   └── weather_remote_data_source.dart
│   ├── models/
│   │   └── weather_model.dart
│   └── repositories/
│       └── weather_repository_impl.dart
├── domain/
│   ├── entities/
│   │   └── weather.dart
│   ├── repositories/
│   │   └── weather_repository.dart
│   └── usecases/
│       └── get_weather.dart
├── presentation/
│   ├── bloc/
│   │   ├── weather_bloc.dart
│   │   ├── weather_event.dart
│   │   └── weather_state.dart
│   ├── pages/
│   │   ├── clean_architecture_page.dart
│   │   └── weather_page.dart
│   └── widgets/
│       └── weather_display.dart
└── README.md
```

## Key Concepts

### Domain Layer

The domain layer contains the business logic of the application. It defines entities, repository interfaces, and use cases.

```dart
// Entity
class Weather {
  final String cityName;
  final double temperature;
  // ...
}

// Repository Interface
abstract class WeatherRepository {
  Future<Weather> getWeatherForCity(String cityName);
}

// Use Case
class GetWeather {
  final WeatherRepository repository;
  
  GetWeather(this.repository);
  
  Future<Weather> execute(String cityName) async {
    return await repository.getWeatherForCity(cityName);
  }
}
```

### Data Layer

The data layer implements the repository interfaces defined in the domain layer. It's responsible for fetching data from external sources.

```dart
// Repository Implementation
class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;
  
  WeatherRepositoryImpl({required this.remoteDataSource});
  
  @override
  Future<Weather> getWeatherForCity(String cityName) async {
    final weatherModel = await remoteDataSource.getWeatherForCity(cityName);
    return weatherModel;
  }
}
```

### Presentation Layer

The presentation layer contains the UI components and the BLoC for state management.

```dart
// BLoC
class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeather getWeather;
  
  WeatherBloc({required this.getWeather}) : super(WeatherInitial()) {
    on<GetWeatherForCityEvent>(_onGetWeatherForCity);
  }
  
  void _onGetWeatherForCity(
    GetWeatherForCityEvent event,
    Emitter<WeatherState> emit,
  ) async {
    emit(WeatherLoading());
    
    try {
      final weather = await getWeather.execute(event.cityName);
      emit(WeatherLoaded(weather));
    } catch (e) {
      emit(WeatherError(e.toString()));
    }
  }
}
```

## Dependency Injection

In this example, we manually set up the dependencies:

```dart
// Create data source
final remoteDataSource = WeatherRemoteDataSourceImpl();

// Create repository with data source
final repository = WeatherRepositoryImpl(
  remoteDataSource: remoteDataSource,
);

// Create use case with repository
final getWeather = GetWeather(repository);

// Create bloc with use case
final weatherBloc = WeatherBloc(getWeather: getWeather);
```

In a real application, you might use a dependency injection framework like `get_it` to manage dependencies.

## Resources

- [Clean Architecture by Robert C. Martin](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- [Flutter Clean Architecture](https://resocoder.com/flutter-clean-architecture-tdd/)
- [get_it Package](https://pub.dev/packages/get_it)
- [dartz Package](https://pub.dev/packages/dartz)
