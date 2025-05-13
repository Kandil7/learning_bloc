import 'package:dartz/dartz.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/clean_architecture/domain/entities/weather.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/clean_architecture/domain/failures/failures.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/clean_architecture/domain/repositories/weather_repository.dart';

/// Get Weather For City Use Case
///
/// This use case gets the weather for a city.
/// It's part of the domain layer and depends only on the repository interface.
class GetWeatherForCity {
  final WeatherRepository repository;

  /// Constructor for GetWeatherForCity
  GetWeatherForCity(this.repository);

  /// Call the use case
  ///
  /// This method is called when the use case is executed.
  /// It validates the input and calls the repository.
  Future<Either<Failure, Weather>> call(String cityName) async {
    // Validate the input
    if (cityName.isEmpty) {
      return const Left(InvalidInputFailure(message: 'City name cannot be empty'));
    }

    // Call the repository
    return repository.getWeatherForCity(cityName);
  }
}
