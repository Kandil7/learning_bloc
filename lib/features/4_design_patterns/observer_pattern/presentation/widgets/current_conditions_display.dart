import 'package:flutter/material.dart';
import '../../implementation/observer.dart';
import '../../implementation/weather_data.dart';

/// CurrentConditionsDisplay
///
/// This observer displays the current weather conditions.
class CurrentConditionsDisplay implements Observer<WeatherData> {
  WeatherData? _weatherData;
  final Function() _onUpdate;

  /// Create a new current conditions display
  CurrentConditionsDisplay(this._onUpdate);

  @override
  void update(WeatherData data) {
    _weatherData = data;
    _onUpdate();
  }

  /// Build the widget to display the current conditions
  Widget build() {
    if (_weatherData == null) {
      return const Card(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Text('No data available'),
          ),
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
              'Current Conditions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.thermostat, size: 24),
                const SizedBox(width: 8),
                Text(
                  'Temperature: ${_weatherData!.temperature.toStringAsFixed(1)}°C',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.water_drop, size: 24),
                const SizedBox(width: 8),
                Text(
                  'Humidity: ${_weatherData!.humidity.toStringAsFixed(1)}%',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.speed, size: 24),
                const SizedBox(width: 8),
                Text(
                  'Pressure: ${_weatherData!.pressure.toStringAsFixed(1)} hPa',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
