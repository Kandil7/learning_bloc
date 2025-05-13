import 'package:equatable/equatable.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/clean_architecture/domain/entities/weather.dart';

/// State for the WeatherBloc
///
/// These states represent the different states of weather data.
sealed class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object?> get props => [];
}

/// Initial state
///
/// This is the initial state of the WeatherBloc.
class WeatherInitial extends WeatherState {}

/// Loading state
///
/// This state indicates that weather data is being loaded.
class WeatherLoading extends WeatherState {}

/// Loaded state
///
/// This state contains the loaded weather data.
class WeatherLoaded extends WeatherState {
  final Weather weather;

  const WeatherLoaded(this.weather);

  @override
  List<Object?> get props => [weather];
}

/// Error state
///
/// This state indicates that an error occurred while loading weather data.
class WeatherError extends WeatherState {
  final String message;

  const WeatherError(this.message);

  @override
  List<Object?> get props => [message];
}
