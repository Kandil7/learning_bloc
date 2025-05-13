import 'dart:convert';
import 'dart:math';

import 'package:flutter_mastery/bloc_learning/examples/clean_architecture_example/data/models/weather_model.dart';

/// WeatherRemoteDataSource
///
/// This class is responsible for fetching weather data from a remote API.
/// In a real app, this would use http package to make API calls.
abstract class WeatherRemoteDataSource {
  /// Get weather data for a specific city
  Future<WeatherModel> getWeatherForCity(String cityName);
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  // In a real app, you would inject an HTTP client here

  @override
  Future<WeatherModel> getWeatherForCity(String cityName) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    // Simulate API response with mock data
    // In a real app, this would be an HTTP request to a weather API

    // Randomly generate temperature between 0 and 35 degrees
    final temperature = Random().nextDouble() * 35;

    // Randomly select a weather condition
    final conditions = ['Sunny', 'Cloudy', 'Rainy', 'Snowy', 'Windy'];
    final condition = conditions[Random().nextInt(conditions.length)];

    // Generate random humidity between 30% and 90%
    final humidity = 30 + Random().nextInt(61);

    // Generate random wind speed between 0 and 30 km/h
    final windSpeed = Random().nextDouble() * 30;

    // Create a mock JSON response
    final Map<String, dynamic> jsonResponse = {
      'name': cityName,
      'main': {
        'temp': temperature,
        'humidity': humidity,
      },
      'weather': [
        {
          'main': condition,
        }
      ],
      'wind': {
        'speed': windSpeed,
      },
    };

    // Convert JSON to WeatherModel
    return WeatherModel.fromJson(jsonResponse);
  }
}
