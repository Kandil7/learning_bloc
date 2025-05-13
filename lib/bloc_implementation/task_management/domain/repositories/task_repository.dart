import 'package:dartz/dartz.dart' hide Task;
import '../entities/task.dart';
import '../../../../core/error/failures.dart';

/// Task Repository Interface
///
/// This defines the contract for any implementation of a task repository.
/// Following the dependency inversion principle, the domain layer defines
/// the interface that the data layer will implement.
abstract class TaskRepository {
  /// Get all tasks
  ///
  /// Returns a [Either] with a [Failure] or a list of [Task] entities
  Future<Either<Failure, List<Task>>> getTasks();

  /// Get a task by ID
  ///
  /// Returns a [Either] with a [Failure] or a [Task] entity
  Future<Either<Failure, Task>> getTaskById(String id);

  /// Create a new task
  ///
  /// Returns a [Either] with a [Failure] or the created [Task] entity
  Future<Either<Failure, Task>> createTask(Task task);

  /// Update an existing task
  ///
  /// Returns a [Either] with a [Failure] or the updated [Task] entity
  Future<Either<Failure, Task>> updateTask(Task task);

  /// Delete a task by ID
  ///
  /// Returns a [Either] with a [Failure] or a [bool] indicating success
  Future<Either<Failure, bool>> deleteTask(String id);
}
