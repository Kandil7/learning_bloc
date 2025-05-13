import 'package:flutter/material.dart';
import '../../implementation/weather_station.dart';
import '../widgets/current_conditions_display.dart';
import '../widgets/forecast_display.dart';
import '../widgets/statistics_display.dart';

/// Observer Pattern Page
///
/// This page demonstrates the Observer Pattern by showing a weather station
/// and multiple observers that display different aspects of the weather data.
class ObserverPatternPage extends StatefulWidget {
  /// Create a new observer pattern page
  const ObserverPatternPage({super.key});

  @override
  State<ObserverPatternPage> createState() => _ObserverPatternPageState();
}

class _ObserverPatternPageState extends State<ObserverPatternPage> {
  // Create the subject (weather station)
  final _weatherStation = WeatherStation();

  // Create the observers
  late final CurrentConditionsDisplay _currentConditionsDisplay;
  late final StatisticsDisplay _statisticsDisplay;
  late final ForecastDisplay _forecastDisplay;

  // Track which observers are active
  bool _showCurrentConditions = true;
  bool _showStatistics = true;
  bool _showForecast = true;

  @override
  void initState() {
    super.initState();

    // Initialize observers with callbacks to update the UI
    _currentConditionsDisplay = CurrentConditionsDisplay(() => setState(() {}));
    _statisticsDisplay = StatisticsDisplay(() => setState(() {}));
    _forecastDisplay = ForecastDisplay(() => setState(() {}));

    // Attach observers to the subject
    _weatherStation.attach(_currentConditionsDisplay);
    _weatherStation.attach(_statisticsDisplay);
    _weatherStation.attach(_forecastDisplay);

    // Initial measurement
    _weatherStation.measureWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Observer Pattern'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildExplanation(),
            const SizedBox(height: 24),
            _buildObserverToggles(),
            const SizedBox(height: 16),
            _buildObserverDisplays(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Simulate a new weather measurement
          _weatherStation.measureWeather();
        },
        tooltip: 'Measure Weather',
        child: const Icon(Icons.refresh),
      ),
    );
  }

  Widget _buildExplanation() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Observer Pattern',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'The Observer Pattern defines a one-to-many dependency between objects so that when one object changes state, all its dependents are notified and updated automatically.',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 8),
            Text('• WeatherStation is the subject that maintains weather data',
                style: TextStyle(fontSize: 14)),
            Text('• Multiple observers display different aspects of the data',
                style: TextStyle(fontSize: 14)),
            Text('• Observers can be attached/detached at runtime',
                style: TextStyle(fontSize: 14)),
            Text(
                '• When the subject changes, all observers are automatically updated',
                style: TextStyle(fontSize: 14)),
            Text('• Press the button below to toggle observers on/off',
                style: TextStyle(fontSize: 14)),
            Text(
                '• Press the floating button to simulate a new weather measurement',
                style: TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }

  Widget _buildObserverToggles() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Toggle Observers',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        SwitchListTile(
          title: const Text('Current Conditions Display'),
          value: _showCurrentConditions,
          onChanged: (value) {
            setState(() {
              _showCurrentConditions = value;
              if (value) {
                _weatherStation.attach(_currentConditionsDisplay);
              } else {
                _weatherStation.detach(_currentConditionsDisplay);
              }
            });
          },
        ),
        SwitchListTile(
          title: const Text('Statistics Display'),
          value: _showStatistics,
          onChanged: (value) {
            setState(() {
              _showStatistics = value;
              if (value) {
                _weatherStation.attach(_statisticsDisplay);
              } else {
                _weatherStation.detach(_statisticsDisplay);
              }
            });
          },
        ),
        SwitchListTile(
          title: const Text('Forecast Display'),
          value: _showForecast,
          onChanged: (value) {
            setState(() {
              _showForecast = value;
              if (value) {
                _weatherStation.attach(_forecastDisplay);
              } else {
                _weatherStation.detach(_forecastDisplay);
              }
            });
          },
        ),
      ],
    );
  }

  Widget _buildObserverDisplays() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Observer Displays',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        if (_showCurrentConditions) ...[
          _currentConditionsDisplay.build(),
          const SizedBox(height: 8),
        ],
        if (_showStatistics) ...[
          _statisticsDisplay.build(),
          const SizedBox(height: 8),
        ],
        if (_showForecast) ...[
          _forecastDisplay.build(),
          const SizedBox(height: 8),
        ],
        if (!_showCurrentConditions && !_showStatistics && !_showForecast)
          const Center(
            child: Text(
              'No observers active. Toggle them on using the switches above.',
              textAlign: TextAlign.center,
            ),
          ),
      ],
    );
  }
}
