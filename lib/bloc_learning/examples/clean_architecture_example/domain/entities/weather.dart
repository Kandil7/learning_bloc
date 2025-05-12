import 'package:equatable/equatable.dart';

/// Weather entity class
/// 
/// This is a domain entity that represents weather information.
/// It's independent of any data source or UI implementation.
class Weather extends Equatable {
  final String cityName;
  final double temperature;
  final String condition;
  final int humidity;
  final double windSpeed;

  const Weather({
    required this.cityName,
    required this.temperature,
    required this.condition,
    required this.humidity,
    required this.windSpeed,
  });

  @override
  List<Object> get props => [cityName, temperature, condition, humidity, windSpeed];
}
