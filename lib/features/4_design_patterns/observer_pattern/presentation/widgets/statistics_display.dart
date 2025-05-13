import 'package:flutter/material.dart';
import '../../implementation/observer.dart';
import '../../implementation/weather_data.dart';

/// StatisticsDisplay
///
/// This observer displays statistics about the weather data.
class StatisticsDisplay implements Observer<WeatherData> {
  double _minTemp = double.infinity;
  double _maxTemp = double.negativeInfinity;
  double _tempSum = 0;
  int _numReadings = 0;
  final Function() _onUpdate;

  /// Create a new statistics display
  StatisticsDisplay(this._onUpdate);

  @override
  void update(WeatherData data) {
    _tempSum += data.temperature;
    _numReadings++;

    _minTemp = _minTemp > data.temperature ? data.temperature : _minTemp;
    _maxTemp = _maxTemp < data.temperature ? data.temperature : _maxTemp;

    _onUpdate();
  }

  /// Build the widget to display the statistics
  Widget build() {
    if (_numReadings == 0) {
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
              'Weather Statistics',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.arrow_upward, size: 24),
                const SizedBox(width: 8),
                Text(
                  'Max: ${_maxTemp.toStringAsFixed(1)}°C',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.arrow_downward, size: 24),
                const SizedBox(width: 8),
                Text(
                  'Min: ${_minTemp.toStringAsFixed(1)}°C',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.calculate, size: 24),
                const SizedBox(width: 8),
                Text(
                  'Avg: ${(_tempSum / _numReadings).toStringAsFixed(1)}°C',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.numbers, size: 24),
                const SizedBox(width: 8),
                Text(
                  'Readings: $_numReadings',
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
