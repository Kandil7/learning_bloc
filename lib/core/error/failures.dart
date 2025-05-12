import 'package:equatable/equatable.dart';

/// Base failure class
///
/// This abstract class is the base for all failures in the application.
/// It extends Equatable to provide value equality.
abstract class Failure extends Equatable {
  const Failure();
  
  @override
  List<Object> get props => [];
}

/// Server failure
///
/// This failure is thrown when there is a server error.
class ServerFailure extends Failure {
  const ServerFailure();
}

/// Cache failure
///
/// This failure is thrown when there is a cache error.
class CacheFailure extends Failure {
  const CacheFailure();
}

/// Network failure
///
/// This failure is thrown when there is a network error.
class NetworkFailure extends Failure {
  const NetworkFailure();
}
