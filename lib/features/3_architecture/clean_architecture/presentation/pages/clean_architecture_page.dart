import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/datasources/weather_remote_data_source.dart';
import '../../data/repositories/weather_repository_impl.dart';
import '../../domain/usecases/get_weather.dart';
import '../bloc/weather_bloc.dart';
import 'weather_page.dart';

/// CleanArchitecturePage
/// 
/// This page demonstrates the Clean Architecture pattern in Flutter.
/// It shows how to separate the application into layers and how to use
/// dependency injection to connect them.
class CleanArchitecturePage extends StatelessWidget {
  const CleanArchitecturePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clean Architecture Example'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildExplanation(),
            const SizedBox(height: 24),
            _buildLayersExplanation(),
            const SizedBox(height: 24),
            _buildDependencyFlowExplanation(),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (context) => _createWeatherBloc(),
                        child: const WeatherPage(),
                      ),
                    ),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'Open Weather App',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildExplanation() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Clean Architecture',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Clean Architecture is a software design philosophy that separates the elements of a design into ring levels. The main rule of clean architecture is that code dependencies can only come from outer levels inward.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Benefits:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('• Independent of frameworks'),
            Text('• Testable business logic'),
            Text('• Independent of UI'),
            Text('• Independent of database'),
            Text('• Independent of external agencies'),
          ],
        ),
      ),
    );
  }
  
  Widget _buildLayersExplanation() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Layers in Clean Architecture',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '1. Domain Layer:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('• Entities (Weather)'),
            Text('• Repository Interfaces (WeatherRepository)'),
            Text('• Use Cases (GetWeather)'),
            SizedBox(height: 8),
            Text(
              '2. Data Layer:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('• Repository Implementations (WeatherRepositoryImpl)'),
            Text('• Data Sources (WeatherRemoteDataSource)'),
            Text('• Models (WeatherModel)'),
            SizedBox(height: 8),
            Text(
              '3. Presentation Layer:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('• BLoCs (WeatherBloc)'),
            Text('• Pages (WeatherPage)'),
            Text('• Widgets (WeatherDisplay)'),
          ],
        ),
      ),
    );
  }
  
  Widget _buildDependencyFlowExplanation() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Dependency Flow',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'In Clean Architecture, dependencies point inward:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text('• Presentation depends on Domain'),
            Text('• Data depends on Domain'),
            Text('• Domain doesn\'t depend on anything'),
            SizedBox(height: 8),
            Text(
              'This is achieved through dependency inversion:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text('• Domain defines interfaces (e.g., WeatherRepository)'),
            Text('• Data implements these interfaces (e.g., WeatherRepositoryImpl)'),
            Text('• Presentation uses the interfaces, not the implementations'),
          ],
        ),
      ),
    );
  }
  
  /// Create and configure the WeatherBloc with its dependencies
  /// 
  /// This method sets up the dependency injection manually.
  /// In a real app, you might use a DI framework like get_it.
  WeatherBloc _createWeatherBloc() {
    // Create data source
    final remoteDataSource = WeatherRemoteDataSourceImpl();
    
    // Create repository with data source
    final repository = WeatherRepositoryImpl(
      remoteDataSource: remoteDataSource,
    );
    
    // Create use case with repository
    final getWeather = GetWeather(repository);
    
    // Create bloc with use case
    return WeatherBloc(getWeather: getWeather);
  }
}
