import 'package:flutter/material.dart';
import 'package:learning_bloc/bloc_learning/examples/observer_pattern_example/observers/observer.dart';
import 'package:learning_bloc/bloc_learning/examples/observer_pattern_example/subjects/weather_station.dart';

/// CurrentConditionsDisplay
/// 
/// This observer displays the current weather conditions.
class CurrentConditionsDisplay implements Observer<WeatherData> {
  WeatherData? _weatherData;
  final Function(WeatherData) _onUpdate;
  
  CurrentConditionsDisplay(this._onUpdate);
  
  @override
  void update(WeatherData data) {
    _weatherData = data;
    _onUpdate(data);
  }
  
  Widget build() {
    if (_weatherData == null) {
      return const Center(
        child: Text('No data available'),
      );
    }
    
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Current Conditions',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
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
                const Icon(Icons.compress, size: 24),
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

/// StatisticsDisplay
/// 
/// This observer displays statistics about the weather data.
class StatisticsDisplay implements Observer<WeatherData> {
  double _minTemp = double.infinity;
  double _maxTemp = double.negativeInfinity;
  double _tempSum = 0;
  int _numReadings = 0;
  final Function() _onUpdate;
  
  StatisticsDisplay(this._onUpdate);
  
  @override
  void update(WeatherData data) {
    _tempSum += data.temperature;
    _numReadings++;
    
    _minTemp = _minTemp > data.temperature ? data.temperature : _minTemp;
    _maxTemp = _maxTemp < data.temperature ? data.temperature : _maxTemp;
    
    _onUpdate();
  }
  
  Widget build() {
    if (_numReadings == 0) {
      return const Center(
        child: Text('No data available'),
      );
    }
    
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Temperature Statistics',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
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

/// ForecastDisplay
/// 
/// This observer displays a simple forecast based on the current weather data.
class ForecastDisplay implements Observer<WeatherData> {
  WeatherData? _weatherData;
  final Function() _onUpdate;
  
  ForecastDisplay(this._onUpdate);
  
  @override
  void update(WeatherData data) {
    _weatherData = data;
    _onUpdate();
  }
  
  Widget build() {
    if (_weatherData == null) {
      return const Center(
        child: Text('No data available'),
      );
    }
    
    String forecast;
    IconData forecastIcon;
    
    if (_weatherData!.temperature > 30) {
      forecast = 'Hot and sunny day ahead!';
      forecastIcon = Icons.wb_sunny;
    } else if (_weatherData!.temperature > 20) {
      forecast = 'Pleasant weather expected.';
      forecastIcon = Icons.wb_cloudy;
    } else if (_weatherData!.temperature > 10) {
      forecast = 'Cool conditions, bring a jacket.';
      forecastIcon = Icons.cloud;
    } else {
      forecast = 'Cold weather, bundle up!';
      forecastIcon = Icons.ac_unit;
    }
    
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Weather Forecast',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(forecastIcon, size: 36),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    forecast,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
