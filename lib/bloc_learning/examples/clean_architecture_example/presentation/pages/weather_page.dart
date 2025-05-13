import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mastery/bloc_learning/examples/clean_architecture_example/presentation/bloc/weather_bloc.dart';
import 'package:flutter_mastery/bloc_learning/examples/clean_architecture_example/presentation/bloc/weather_event.dart';
import 'package:flutter_mastery/bloc_learning/examples/clean_architecture_example/presentation/bloc/weather_state.dart';
import 'package:flutter_mastery/bloc_learning/examples/clean_architecture_example/presentation/widgets/weather_display.dart';

/// WeatherPage
///
/// This is the main screen for the weather feature.
/// It allows users to search for weather by city and displays the results.
class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final _cityController = TextEditingController();

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildExplanation(),
            const SizedBox(height: 24),
            _buildCityInput(),
            const SizedBox(height: 24),
            _buildWeatherContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildExplanation() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue[200]!),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Clean Architecture with BLoC',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 8),
          Text(
            'This example demonstrates Clean Architecture principles:',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 4),
          Text('• Domain Layer: Business entities and use cases',
              style: TextStyle(fontSize: 14)),
          Text('• Data Layer: Repository implementation and data sources',
              style: TextStyle(fontSize: 14)),
          Text('• Presentation Layer: BLoC, UI components',
              style: TextStyle(fontSize: 14)),
          Text(
              '• Dependency flows inward: UI → BLoC → Use Cases → Repositories',
              style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildCityInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _cityController,
          decoration: const InputDecoration(
            labelText: 'Enter City Name',
            hintText: 'e.g., London, New York, Tokyo',
            prefixIcon: Icon(Icons.location_city),
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            final cityName = _cityController.text.trim();
            if (cityName.isNotEmpty) {
              context.read<WeatherBloc>().add(GetWeatherForCityEvent(cityName));
            }
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12),
          ),
          child: const Text('GET WEATHER', style: TextStyle(fontSize: 16)),
        ),
      ],
    );
  }

  Widget _buildWeatherContent() {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherInitial) {
          return const Center(
            child: Text('Enter a city name to get weather information'),
          );
        } else if (state is WeatherLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is WeatherLoaded) {
          return WeatherDisplay(weather: state.weather);
        } else if (state is WeatherError) {
          return Center(
            child: Column(
              children: [
                const Icon(Icons.error, color: Colors.red, size: 48),
                const SizedBox(height: 16),
                Text(
                  'Error: ${state.message}',
                  style: const TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
