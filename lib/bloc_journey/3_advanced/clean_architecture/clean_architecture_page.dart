import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/clean_architecture/data/datasources/weather_remote_data_source.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/clean_architecture/data/repositories/weather_repository_impl.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/clean_architecture/domain/usecases/get_weather_for_city.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/clean_architecture/presentation/bloc/weather_bloc.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/clean_architecture/presentation/pages/weather_page.dart';

/// Clean Architecture Page
///
/// This page demonstrates the use of BLoC with Clean Architecture.
class CleanArchitecturePage extends StatelessWidget {
  const CleanArchitecturePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BLoC with Clean Architecture'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Explanation text
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'This example demonstrates the use of BLoC with Clean Architecture. '
                'The app is divided into three layers: presentation, domain, and data. '
                'The presentation layer contains the UI and BLoC, the domain layer contains '
                'the business logic, and the data layer contains the data sources and repositories.',
                style: TextStyle(fontSize: 16),
              ),
            ),
            
            // Architecture diagram
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  color: Colors.grey[200],
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Clean Architecture Layers',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildLayerBox(
                        'Presentation Layer',
                        'UI, BLoC, Pages, Widgets',
                        Colors.blue[100]!,
                      ),
                      const SizedBox(height: 8),
                      _buildLayerBox(
                        'Domain Layer',
                        'Entities, Use Cases, Repository Interfaces',
                        Colors.green[100]!,
                      ),
                      const SizedBox(height: 8),
                      _buildLayerBox(
                        'Data Layer',
                        'Models, Repository Implementations, Data Sources',
                        Colors.orange[100]!,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
            // Weather app
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Weather App Example',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'This is a simple weather app that demonstrates the use of BLoC with Clean Architecture. '
                        'Enter a city name to get the weather information.',
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BlocProvider(
                                create: (context) => WeatherBloc(
                                  getWeatherForCity: GetWeatherForCity(
                                    WeatherRepositoryImpl(
                                      remoteDataSource: WeatherRemoteDataSourceImpl(),
                                    ),
                                  ),
                                ),
                                child: const WeatherPage(),
                              ),
                            ),
                          );
                        },
                        child: const Text('Open Weather App'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
            // Code explanation
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.grey[200],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Key Concepts:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Text('• Separation of concerns: UI, business logic, and data access'),
                  Text('• Dependency rule: Inner layers don\'t depend on outer layers'),
                  Text('• Use cases: Represent business logic operations'),
                  Text('• Repository pattern: Abstracts data sources'),
                  SizedBox(height: 16),
                  Text(
                    'Implementation Details:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Text('1. Domain layer defines entities, use cases, and repository interfaces'),
                  Text('2. Data layer implements repositories and data sources'),
                  Text('3. Presentation layer contains BLoC and UI components'),
                  Text('4. Dependencies flow inward: Presentation → Domain ← Data'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Build a layer box
  Widget _buildLayerBox(String title, String content, Color color) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4),
          Text(content),
        ],
      ),
    );
  }
}
