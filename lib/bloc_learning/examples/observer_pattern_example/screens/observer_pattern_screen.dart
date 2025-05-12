import 'package:flutter/material.dart';
import 'package:learning_bloc/bloc_learning/examples/observer_pattern_example/observers/weather_observers.dart';
import 'package:learning_bloc/bloc_learning/examples/observer_pattern_example/subjects/weather_station.dart';

/// ObserverPatternScreen
/// 
/// This screen demonstrates the Observer Pattern by showing a weather station
/// and multiple observers that display different aspects of the weather data.
class ObserverPatternScreen extends StatefulWidget {
  const ObserverPatternScreen({Key? key}) : super(key: key);

  @override
  State<ObserverPatternScreen> createState() => _ObserverPatternScreenState();
}

class _ObserverPatternScreenState extends State<ObserverPatternScreen> {
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
    _currentConditionsDisplay = CurrentConditionsDisplay((_) => setState(() {}));
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
        title: const Text('Observer Pattern Example'),
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
            'Observer Pattern',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 8),
          Text(
            'This example demonstrates the Observer Pattern:',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 4),
          Text('• WeatherStation is the subject that maintains weather data', style: TextStyle(fontSize: 14)),
          Text('• Multiple observers display different aspects of the data', style: TextStyle(fontSize: 14)),
          Text('• Observers can be attached/detached at runtime', style: TextStyle(fontSize: 14)),
          Text('• When the subject changes, all observers are automatically updated', style: TextStyle(fontSize: 14)),
          Text('• Press the button below to toggle observers on/off', style: TextStyle(fontSize: 14)),
          Text('• Press the floating button to simulate a new weather measurement', style: TextStyle(fontSize: 14)),
        ],
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
