import 'package:flutter_mastery/bloc_journey/3_advanced/clean_architecture/domain/entities/weather.dart';

/// Weather Model
///
/// This class is a model that extends the Weather entity.
/// It's part of the data layer and adds serialization/deserialization functionality.
class WeatherModel extends Weather {
  /// Constructor for WeatherModel
  const WeatherModel({
    required String cityName,
    required double temperature,
    required String condition,
    required double humidity,
    required double windSpeed,
  }) : super(
          cityName: cityName,
          temperature: temperature,
          condition: condition,
          humidity: humidity,
          windSpeed: windSpeed,
        );

  /// Create a WeatherModel from JSON
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'] as String,
      temperature: (json['main']['temp'] as num).toDouble(),
      condition: json['weather'][0]['main'] as String,
      humidity: (json['main']['humidity'] as num).toDouble(),
      windSpeed: (json['wind']['speed'] as num).toDouble(),
    );
  }

  /// Convert WeatherModel to JSON
  Map<String, dynamic> toJson() {
    return {
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
  }
}
