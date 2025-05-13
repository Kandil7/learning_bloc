import 'package:flutter/material.dart';
import 'package:flutter_mastery/bloc_learning/examples/clean_architecture_example/domain/entities/weather.dart';

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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              weather.cityName,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildWeatherIcon(),
            const SizedBox(height: 16),
            Text(
              '${weather.temperature.toStringAsFixed(1)}°C',
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              weather.condition,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildWeatherDetail(
                  Icons.water_drop,
                  '${weather.humidity}%',
                  'Humidity',
                ),
                _buildWeatherDetail(
                  Icons.air,
                  '${weather.windSpeed.toStringAsFixed(1)} km/h',
                  'Wind',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeatherIcon() {
    IconData iconData;
    Color iconColor;

    // Determine icon based on weather condition
    switch (weather.condition.toLowerCase()) {
      case 'sunny':
        iconData = Icons.wb_sunny;
        iconColor = Colors.orange;
        break;
      case 'cloudy':
        iconData = Icons.cloud;
        iconColor = Colors.grey;
        break;
      case 'rainy':
        iconData = Icons.grain;
        iconColor = Colors.blue;
        break;
      case 'snowy':
        iconData = Icons.ac_unit;
        iconColor = Colors.lightBlue;
        break;
      case 'windy':
        iconData = Icons.air;
        iconColor = Colors.blueGrey;
        break;
      default:
        iconData = Icons.wb_sunny;
        iconColor = Colors.orange;
    }

    return Icon(
      iconData,
      size: 80,
      color: iconColor,
    );
  }

  Widget _buildWeatherDetail(IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(icon, size: 24),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
