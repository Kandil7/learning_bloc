import 'package:flutter/material.dart';
import '../../domain/entities/weather.dart';

/// WeatherDisplay Widget
/// 
/// This widget displays weather information in a visually appealing way.
class WeatherDisplay extends StatelessWidget {
  final Weather weather;
  
  const WeatherDisplay({Key? key, required this.weather}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                weather.cityName,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: _getWeatherIcon(weather.condition),
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                '${weather.temperature.toStringAsFixed(1)}°C',
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                weather.condition,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 24),
            _buildDetailRow(
              Icons.water_drop,
              'Humidity',
              '${weather.humidity}%',
            ),
            const SizedBox(height: 8),
            _buildDetailRow(
              Icons.air,
              'Wind Speed',
              '${weather.windSpeed.toStringAsFixed(1)} km/h',
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 20),
        const SizedBox(width: 8),
        Text(label, style: const TextStyle(fontSize: 16)),
        const Spacer(),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
  
  Widget _getWeatherIcon(String condition) {
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
      case 'snowy':
        iconData = Icons.ac_unit;
        color = Colors.lightBlue;
        break;
      case 'windy':
        iconData = Icons.air;
        color = Colors.blueGrey;
        break;
      default:
        iconData = Icons.cloud;
        color = Colors.grey;
    }
    
    return Icon(
      iconData,
      size: 80,
      color: color,
    );
  }
}
