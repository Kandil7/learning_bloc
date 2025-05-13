import 'package:equatable/equatable.dart';

/// Base Failure class
///
/// This class is the base for all failures in the domain layer.
abstract class Failure extends Equatable {
  const Failure();

  @override
  List<Object?> get props => [];
}

/// Server Failure
///
/// This failure occurs when there's a problem with the server.
class ServerFailure extends Failure {
  final String message;

  const ServerFailure({this.message = 'Server error'});

  @override
  List<Object?> get props => [message];
}

/// Network Failure
///
/// This failure occurs when there's a problem with the network.
class NetworkFailure extends Failure {
  final String message;

  const NetworkFailure({this.message = 'Network error'});

  @override
  List<Object?> get props => [message];
}

/// Cache Failure
///
/// This failure occurs when there's a problem with the cache.
class CacheFailure extends Failure {
  final String message;

  const CacheFailure({this.message = 'Cache error'});

  @override
  List<Object?> get props => [message];
}

/// Invalid Input Failure
///
/// This failure occurs when the input is invalid.
class InvalidInputFailure extends Failure {
  final String message;

  const InvalidInputFailure({this.message = 'Invalid input'});

  @override
  List<Object?> get props => [message];
}
