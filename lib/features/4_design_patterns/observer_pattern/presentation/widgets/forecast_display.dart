import 'package:flutter/material.dart';
import '../../implementation/observer.dart';
import '../../implementation/weather_data.dart';

/// ForecastDisplay
///
/// This observer displays a simple forecast based on the current weather data.
class ForecastDisplay implements Observer<WeatherData> {
  WeatherData? _weatherData;
  final Function() _onUpdate;

  /// Create a new forecast display
  ForecastDisplay(this._onUpdate);

  @override
  void update(WeatherData data) {
    _weatherData = data;
    _onUpdate();
  }

  /// Get a forecast based on the current weather data
  String _getForecast() {
    if (_weatherData == null) {
      return 'No data available';
    }

    final temp = _weatherData!.temperature;
    final humidity = _weatherData!.humidity;

    if (temp > 30) {
      return 'Hot day ahead! Stay hydrated.';
    } else if (temp > 25) {
      return 'Warm and pleasant weather.';
    } else if (temp > 20) {
      return 'Mild conditions expected.';
    } else if (temp > 15) {
      return 'Cool weather, consider a light jacket.';
    } else {
      return 'Cold conditions, bundle up!';
    }
  }

  /// Get an icon based on the current weather data
  IconData _getWeatherIcon() {
    if (_weatherData == null) {
      return Icons.cloud_off;
    }

    final temp = _weatherData!.temperature;
    final humidity = _weatherData!.humidity;

    if (temp > 30) {
      return Icons.wb_sunny;
    } else if (temp > 25) {
      return humidity > 70 ? Icons.cloud : Icons.wb_sunny;
    } else if (temp > 20) {
      return humidity > 70 ? Icons.cloud : Icons.wb_cloudy;
    } else if (temp > 15) {
      return humidity > 70 ? Icons.grain : Icons.cloud;
    } else {
      return humidity > 70 ? Icons.ac_unit : Icons.cloud;
    }
  }

  /// Build the widget to display the forecast
  Widget build() {
    if (_weatherData == null) {
      return const Card(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(child: Text('No data available')),
        ),
      );
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Weather Forecast',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Center(
              child: Icon(_getWeatherIcon(), size: 64, color: Colors.blue),
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                _getForecast(),
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
