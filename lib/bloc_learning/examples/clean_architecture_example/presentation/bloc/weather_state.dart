import 'package:equatable/equatable.dart';
import 'package:flutter_mastery/bloc_learning/examples/clean_architecture_example/domain/entities/weather.dart';

/// WeatherState
///
/// Base class for all weather-related states
abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

/// WeatherInitial
///
/// Initial state when no weather data has been requested yet
class WeatherInitial extends WeatherState {}

/// WeatherLoading
///
/// State when weather data is being fetched
class WeatherLoading extends WeatherState {}

/// WeatherLoaded
///
/// State when weather data has been successfully loaded
class WeatherLoaded extends WeatherState {
  final Weather weather;

  const WeatherLoaded(this.weather);

  @override
  List<Object> get props => [weather];
}

/// WeatherError
///
/// State when an error occurs while fetching weather data
class WeatherError extends WeatherState {
  final String message;

  const WeatherError(this.message);

  @override
  List<Object> get props => [message];
}
