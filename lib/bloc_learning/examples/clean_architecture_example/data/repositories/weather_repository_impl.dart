import 'package:learning_bloc/bloc_learning/examples/clean_architecture_example/data/datasources/weather_remote_data_source.dart';
import 'package:learning_bloc/bloc_learning/examples/clean_architecture_example/domain/entities/weather.dart';
import 'package:learning_bloc/bloc_learning/examples/clean_architecture_example/domain/repositories/weather_repository.dart';

/// WeatherRepositoryImpl
/// 
/// This class implements the WeatherRepository interface from the domain layer.
/// It's responsible for coordinating data from different sources (remote, local, etc.)
class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;
  
  WeatherRepositoryImpl({required this.remoteDataSource});
  
  @override
  Future<Weather> getWeatherForCity(String cityName) async {
    try {
      // In a real app, you might check a local cache first
      // and implement caching logic here
      
      // Get data from remote source
      final weatherModel = await remoteDataSource.getWeatherForCity(cityName);
      
      // Return the model (which is also a Weather entity)
      return weatherModel;
    } catch (e) {
      // In a real app, you would handle specific exceptions
      // and possibly map them to domain-specific exceptions
      throw Exception('Failed to get weather data: $e');
    }
  }
}
