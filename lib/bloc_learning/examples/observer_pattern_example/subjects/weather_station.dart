import 'dart:math';

import 'package:flutter_mastery/bloc_learning/examples/observer_pattern_example/observers/observer.dart';
import 'package:flutter_mastery/bloc_learning/examples/observer_pattern_example/subjects/subject.dart';

/// WeatherData
///
/// This class represents the data that the WeatherStation will provide to its observers.
class WeatherData {
  final double temperature;
  final double humidity;
  final double pressure;

  const WeatherData({
    required this.temperature,
    required this.humidity,
    required this.pressure,
  });

  @override
  String toString() {
    return 'Temperature: ${temperature.toStringAsFixed(1)}°C, Humidity: ${humidity.toStringAsFixed(1)}%, Pressure: ${pressure.toStringAsFixed(1)} hPa';
  }
}

/// WeatherStation
///
/// This class is a concrete implementation of the Subject interface.
/// It maintains weather data and notifies observers when the data changes.
class WeatherStation implements Subject<WeatherData> {
  // List of observers
  final List<Observer<WeatherData>> _observers = [];

  // Current weather data
  WeatherData _weatherData = const WeatherData(
    temperature: 25.0,
    humidity: 60.0,
    pressure: 1013.0,
  );

  // Getter for the current weather data
  WeatherData get weatherData => _weatherData;

  @override
  void attach(Observer<WeatherData> observer) {
    if (!_observers.contains(observer)) {
      _observers.add(observer);
    }
  }

  @override
  void detach(Observer<WeatherData> observer) {
    _observers.remove(observer);
  }

  @override
  void notify() {
    for (var observer in _observers) {
      observer.update(_weatherData);
    }
  }

  /// Simulate a weather measurement
  void measureWeather() {
    // Generate random weather data
    final random = Random();

    // Temperature between 15 and 35 degrees
    final temperature = 15.0 + random.nextDouble() * 20.0;

    // Humidity between 40% and 90%
    final humidity = 40.0 + random.nextDouble() * 50.0;

    // Pressure between 990 and 1030 hPa
    final pressure = 990.0 + random.nextDouble() * 40.0;

    // Update the weather data
    _weatherData = WeatherData(
      temperature: temperature,
      humidity: humidity,
      pressure: pressure,
    );

    // Notify all observers
    notify();
  }
}
