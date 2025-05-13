import 'package:dartz/dartz.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/clean_architecture/data/datasources/weather_remote_data_source.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/clean_architecture/domain/entities/weather.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/clean_architecture/domain/failures/failures.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/clean_architecture/domain/repositories/weather_repository.dart';

/// Weather Repository Implementation
///
/// This class implements the WeatherRepository interface.
/// It's part of the data layer and depends on the data sources.
class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;

  /// Constructor for WeatherRepositoryImpl
  WeatherRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, Weather>> getWeatherForCity(String cityName) async {
    try {
      // Call the remote data source
      final weatherModel = await remoteDataSource.getWeatherForCity(cityName);
      
      // Return the weather model as a Weather entity
      return Right(weatherModel);
    } catch (e) {
      // Handle errors and return appropriate failures
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
