import 'package:equatable/equatable.dart';

/// Events for the WeatherBloc
///
/// These events represent weather-related actions.
sealed class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object?> get props => [];
}

/// Event to get weather for a city
class GetWeatherForCityEvent extends WeatherEvent {
  final String cityName;

  const GetWeatherForCityEvent(this.cityName);

  @override
  List<Object?> get props => [cityName];
}
