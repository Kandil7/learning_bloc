import 'package:equatable/equatable.dart';

/// Weather entity
///
/// This class represents the weather data in the domain layer.
class Weather extends Equatable {
  final String cityName;
  final double temperature;
  final String condition;
  final double humidity;
  final double windSpeed;

  /// Constructor for Weather
  const Weather({
    required this.cityName,
    required this.temperature,
    required this.condition,
    required this.humidity,
    required this.windSpeed,
  });

  @override
  List<Object?> get props => [
        cityName,
        temperature,
        condition,
        humidity,
        windSpeed,
      ];
}
