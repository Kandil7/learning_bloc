/// WeatherData
///
/// This class represents the data that the WeatherStation will provide to its observers.
class WeatherData {
  /// The current temperature in Celsius
  final double temperature;
  
  /// The current humidity percentage
  final double humidity;
  
  /// The current atmospheric pressure in hPa
  final double pressure;

  /// Create a new weather data instance
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
