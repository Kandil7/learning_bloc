import 'package:equatable/equatable.dart';

/// WeatherEvent
/// 
/// Base class for all weather-related events
abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
  
  @override
  List<Object> get props => [];
}

/// GetWeatherForCityEvent
/// 
/// Event triggered when user requests weather for a specific city
class GetWeatherForCityEvent extends WeatherEvent {
  final String cityName;
  
  const GetWeatherForCityEvent(this.cityName);
  
  @override
  List<Object> get props => [cityName];
}
