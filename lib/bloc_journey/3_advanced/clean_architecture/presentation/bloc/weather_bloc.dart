import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/clean_architecture/domain/usecases/get_weather_for_city.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/clean_architecture/presentation/bloc/weather_event.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/clean_architecture/presentation/bloc/weather_state.dart';

/// BLoC for weather
///
/// This BLoC handles weather-related events and states.
/// It's part of the presentation layer and depends on the use cases.
class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeatherForCity getWeatherForCity;

  /// Constructor for WeatherBloc
  WeatherBloc({required this.getWeatherForCity}) : super(WeatherInitial()) {
    // Register event handlers
    on<GetWeatherForCityEvent>(_onGetWeatherForCity);
  }

  /// Handle the get weather for city event
  void _onGetWeatherForCity(
      GetWeatherForCityEvent event, Emitter<WeatherState> emit) async {
    // Emit loading state
    emit(WeatherLoading());

    // Call the use case
    final result = await getWeatherForCity(event.cityName);

    // Emit state based on the result
    result.fold(
      // Handle failure
      (failure) => emit(WeatherError(failure.toString())),
      // Handle success
      (weather) => emit(WeatherLoaded(weather)),
    );
  }
}
