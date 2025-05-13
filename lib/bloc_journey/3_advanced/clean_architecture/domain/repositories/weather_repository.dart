import 'package:dartz/dartz.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/clean_architecture/domain/entities/weather.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/clean_architecture/domain/failures/failures.dart';

/// Weather Repository Interface
///
/// This interface defines the contract for the weather repository.
/// It's part of the domain layer and doesn't depend on any implementation details.
abstract class WeatherRepository {
  /// Get the current weather for a city
  ///
  /// Returns a [Weather] entity wrapped in [Either] to handle failures.
  Future<Either<Failure, Weather>> getWeatherForCity(String cityName);
}
