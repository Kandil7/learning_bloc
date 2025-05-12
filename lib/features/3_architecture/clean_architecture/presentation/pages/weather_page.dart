import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/weather_bloc.dart';
import '../bloc/weather_event.dart';
import '../bloc/weather_state.dart';
import '../widgets/weather_display.dart';

/// WeatherPage
/// 
/// This page allows users to search for weather information by city name.
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchBar(),
            const SizedBox(height: 24),
            Expanded(
              child: _buildWeatherDisplay(),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildSearchBar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Enter a city name:',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _cityController,
                decoration: const InputDecoration(
                  hintText: 'e.g., London',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(width: 16),
            ElevatedButton(
              onPressed: () {
                if (_cityController.text.isNotEmpty) {
                  context.read<WeatherBloc>().add(
                    GetWeatherForCityEvent(_cityController.text),
                  );
                }
              },
              child: const Text('Search'),
            ),
          ],
        ),
      ],
    );
  }
  
  Widget _buildWeatherDisplay() {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherInitial) {
          return const Center(
            child: Text(
              'Enter a city name to get weather information',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 60,
                ),
                const SizedBox(height: 16),
                Text(
                  'Error: ${state.message}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
