import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mastery/bloc_learning/examples/clean_architecture_example/data/datasources/weather_remote_data_source.dart';
import 'package:flutter_mastery/bloc_learning/examples/clean_architecture_example/data/repositories/weather_repository_impl.dart';
import 'package:flutter_mastery/bloc_learning/examples/clean_architecture_example/domain/usecases/get_weather.dart';
import 'package:flutter_mastery/bloc_learning/examples/clean_architecture_example/presentation/bloc/weather_bloc.dart';
import 'package:flutter_mastery/bloc_learning/examples/clean_architecture_example/presentation/pages/weather_page.dart';

/// CleanArchitectureScreen
///
/// This is the entry point for the Clean Architecture example.
/// It sets up the dependency injection and provides the WeatherBloc to the widget tree.
class CleanArchitectureScreen extends StatelessWidget {
  const CleanArchitectureScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _createWeatherBloc(),
      child: const WeatherPage(),
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
