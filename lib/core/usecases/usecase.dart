import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../error/failures.dart';

/// UseCase abstract class
///
/// This is the base class for all use cases in the application.
/// It defines a common interface for all use cases.
abstract class UseCase<Type, Params> {
  /// Call method
  ///
  /// This method is the entry point for executing the use case.
  /// It takes parameters of type [Params] and returns a [Future] with an [Either]
  /// containing either a [Failure] or a result of type [Type].
  Future<Either<Failure, Type>> call(Params params);
}

/// NoParams class
///
/// This class is used when a use case doesn't require any parameters.
class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
