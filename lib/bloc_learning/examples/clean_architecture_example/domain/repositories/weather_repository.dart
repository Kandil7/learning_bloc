import 'package:learning_bloc/bloc_learning/examples/clean_architecture_example/domain/entities/weather.dart';

/// Weather Repository Interface
/// 
/// This abstract class defines the contract for weather data operations.
/// The implementation details (API, database, etc.) are hidden from the domain layer.
abstract class WeatherRepository {
  /// Get weather information for a specific city
  /// 
  /// Returns a [Future] that completes with a [Weather] entity
  /// or throws an exception if the operation fails
  Future<Weather> getWeatherForCity(String cityName);
}
