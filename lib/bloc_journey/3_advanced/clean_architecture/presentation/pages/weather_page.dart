import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/clean_architecture/presentation/bloc/weather_bloc.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/clean_architecture/presentation/bloc/weather_event.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/clean_architecture/presentation/bloc/weather_state.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/clean_architecture/presentation/widgets/weather_display.dart';

/// Weather Page
///
/// This page displays weather information and allows the user to search for a city.
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
        title: const Text('Weather'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search bar
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _cityController,
                      decoration: const InputDecoration(
                        labelText: 'City',
                        hintText: 'Enter a city name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      final cityName = _cityController.text.trim();
                      if (cityName.isNotEmpty) {
                        context.read<WeatherBloc>().add(
                              GetWeatherForCityEvent(cityName),
                            );
                      }
                    },
                    child: const Text('Search'),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              
              // Weather display
              BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
                  return switch (state) {
                    WeatherInitial() => const Center(
                        child: Text('Enter a city name to get the weather'),
                      ),
                    WeatherLoading() => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    WeatherLoaded() => WeatherDisplay(weather: state.weather),
                    WeatherError() => Center(
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
                              'Error',
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              state.message,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                  };
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
