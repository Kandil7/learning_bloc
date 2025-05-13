import 'dart:math';

import 'package:flutter_mastery/bloc_journey/3_advanced/clean_architecture/data/models/weather_model.dart';

/// Weather Remote Data Source
///
/// This class is responsible for fetching weather data from a remote source.
/// It's part of the data layer and doesn't depend on the domain layer.
abstract class WeatherRemoteDataSource {
  /// Get weather for a city
  ///
  /// This method fetches weather data for a city from a remote source.
  Future<WeatherModel> getWeatherForCity(String cityName);
}

/// Weather Remote Data Source Implementation
///
/// This class implements the WeatherRemoteDataSource interface.
/// It simulates fetching weather data from a remote source.
class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  /// Constructor for WeatherRemoteDataSourceImpl
  WeatherRemoteDataSourceImpl();

  @override
  Future<WeatherModel> getWeatherForCity(String cityName) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    // Simulate random failure (20% chance)
    if (Random().nextDouble() < 0.2) {
      throw Exception('Failed to fetch weather data');
    }

    // Return mock data based on city name
    return _getMockWeatherForCity(cityName);
  }

  /// Get mock weather for a city
  ///
  /// This method returns mock weather data for a city.
  WeatherModel _getMockWeatherForCity(String cityName) {
    // Generate random weather data
    final random = Random();
    final temperature = 10 + random.nextDouble() * 25; // 10-35°C
    final humidity = 30 + random.nextDouble() * 60; // 30-90%
    final windSpeed = 1 + random.nextDouble() * 20; // 1-21 km/h

    // Get condition based on temperature
    final condition = _getConditionForTemperature(temperature);

    return WeatherModel(
      cityName: cityName,
      temperature: double.parse(temperature.toStringAsFixed(1)),
      condition: condition,
      humidity: double.parse(humidity.toStringAsFixed(1)),
      windSpeed: double.parse(windSpeed.toStringAsFixed(1)),
    );
  }

  /// Get condition for temperature
  ///
  /// This method returns a weather condition based on temperature.
  String _getConditionForTemperature(double temperature) {
    if (temperature < 15) {
      return 'Cloudy';
    } else if (temperature < 25) {
      return 'Sunny';
    } else {
      return 'Hot';
    }
  }
}
