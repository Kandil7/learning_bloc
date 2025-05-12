import 'package:dartz/dartz.dart';
import '../../../../../core/error/failures.dart';
import '../entities/todo.dart';

/// Todo repository interface
///
/// This interface defines the contract for the todo repository.
/// It is implemented by the TodoRepositoryImpl in the data layer.
abstract class TodoRepository {
  /// Get all todos
  ///
  /// Returns a list of todos if successful, or a failure if not.
  Future<Either<Failure, List<Todo>>> getTodos();
  
  /// Save a todo
  ///
  /// Returns void if successful, or a failure if not.
  Future<Either<Failure, void>> saveTodo(Todo todo);
  
  /// Delete a todo
  ///
  /// Returns void if successful, or a failure if not.
  Future<Either<Failure, void>> deleteTodo(String id);
  
  /// Update a todo
  ///
  /// Returns void if successful, or a failure if not.
  Future<Either<Failure, void>> updateTodo(Todo todo);
}
