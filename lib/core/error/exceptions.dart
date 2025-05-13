/// Server exception
///
/// This exception is thrown when there is a server error.
class ServerException implements Exception {
  /// Message describing the exception
  final String message;

  /// Creates a new ServerException instance
  ServerException({this.message = 'Server error occurred'});
}

/// Cache exception
///
/// This exception is thrown when there is a cache error.
class CacheException implements Exception {
  /// Message describing the exception
  final String message;

  /// Creates a new CacheException instance
  CacheException({this.message = 'Cache error occurred'});
}

/// Network exception
///
/// This exception is thrown when there is a network error.
class NetworkException implements Exception {
  /// Message describing the exception
  final String message;

  /// Creates a new NetworkException instance
  NetworkException({this.message = 'Network error occurred'});
}

/// Validation exception
///
/// This exception is thrown when there is a validation error.
class ValidationException implements Exception {
  /// Message describing the exception
  final String message;

  /// Creates a new ValidationException instance
  ValidationException({this.message = 'Validation error occurred'});
}
