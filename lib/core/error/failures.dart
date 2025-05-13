import 'package:equatable/equatable.dart';

/// Base failure class
///
/// This abstract class is the base for all failures in the application.
/// It extends Equatable to provide value equality.
abstract class Failure extends Equatable {
  /// Message describing the failure
  final String message;

  /// Creates a new Failure instance
  const Failure({this.message = 'An error occurred'});

  @override
  List<Object> get props => [message];
}

/// Server failure
///
/// This failure is thrown when there is a server error.
class ServerFailure extends Failure {
  /// Creates a new ServerFailure instance
  const ServerFailure({super.message = 'Server error occurred'});
}

/// Cache failure
///
/// This failure is thrown when there is a cache error.
class CacheFailure extends Failure {
  /// Creates a new CacheFailure instance
  const CacheFailure({super.message = 'Cache error occurred'});
}

/// Network failure
///
/// This failure is thrown when there is a network error.
class NetworkFailure extends Failure {
  /// Creates a new NetworkFailure instance
  const NetworkFailure({super.message = 'Network error occurred'});
}

/// Validation failure
///
/// This failure is thrown when there is a validation error.
class ValidationFailure extends Failure {
  /// Creates a new ValidationFailure instance
  const ValidationFailure({super.message = 'Validation error occurred'});
}
