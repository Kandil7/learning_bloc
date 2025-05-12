import '../entities/weather.dart';
import '../repositories/weather_repository.dart';

/// GetWeather Use Case
/// 
/// This class implements a specific use case: getting weather for a city.
/// It depends on the repository interface, not the implementation.
class GetWeather {
  final WeatherRepository repository;

  GetWeather(this.repository);

  /// Execute the use case
  /// 
  /// This method encapsulates the business logic for getting weather.
  /// It delegates the data fetching to the repository.
  Future<Weather> execute(String cityName) async {
    return await repository.getWeatherForCity(cityName);
  }
}
