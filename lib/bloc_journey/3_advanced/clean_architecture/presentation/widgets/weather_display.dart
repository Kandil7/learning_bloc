import 'package:flutter/material.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/clean_architecture/domain/entities/weather.dart';

/// Weather Display Widget
///
/// This widget displays weather information.
class WeatherDisplay extends StatelessWidget {
  final Weather weather;

  const WeatherDisplay({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // City name
            Center(
              child: Text(
                weather.cityName,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            const SizedBox(height: 16),
            
            // Temperature and condition
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildWeatherIcon(weather.condition),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${weather.temperature}°C',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    Text(
                      weather.condition,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            
            // Additional details
            _buildDetailRow(Icons.water_drop, 'Humidity', '${weather.humidity}%'),
            const SizedBox(height: 8),
            _buildDetailRow(Icons.air, 'Wind Speed', '${weather.windSpeed} km/h'),
          ],
        ),
      ),
    );
  }

  /// Build a detail row
  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 20),
        const SizedBox(width: 8),
        Text(label),
        const Spacer(),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  /// Build a weather icon
  Widget _buildWeatherIcon(String condition) {
    IconData iconData;
    Color color;

    switch (condition.toLowerCase()) {
      case 'sunny':
        iconData = Icons.wb_sunny;
        color = Colors.orange;
        break;
      case 'cloudy':
        iconData = Icons.cloud;
        color = Colors.grey;
        break;
      case 'rainy':
        iconData = Icons.water_drop;
        color = Colors.blue;
        break;
      case 'hot':
        iconData = Icons.whatshot;
        color = Colors.red;
        break;
      default:
        iconData = Icons.cloud;
        color = Colors.grey;
    }

    return Icon(
      iconData,
      size: 60,
      color: color,
    );
  }
}
