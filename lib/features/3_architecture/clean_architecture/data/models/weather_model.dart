import '../../domain/entities/weather.dart';

/// WeatherModel
/// 
/// This class extends the domain entity and adds data layer functionality.
/// It handles serialization/deserialization of weather data.
class WeatherModel extends Weather {
  const WeatherModel({
    required String cityName,
    required double temperature,
    required String condition,
    required int humidity,
    required double windSpeed,
  }) : super(
          cityName: cityName,
          temperature: temperature,
          condition: condition,
          humidity: humidity,
          windSpeed: windSpeed,
        );

  /// Create a WeatherModel from JSON data
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'],
      temperature: (json['main']['temp'] as num).toDouble(),
      condition: json['weather'][0]['main'],
      humidity: json['main']['humidity'],
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
