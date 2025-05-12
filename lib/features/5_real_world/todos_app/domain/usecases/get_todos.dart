import 'package:dartz/dartz.dart';
import '../../../../../core/error/failures.dart';
import '../entities/todo.dart';
import '../repositories/todo_repository.dart';

/// Get todos use case
///
/// This use case is responsible for getting all todos.
/// It uses the TodoRepository to get the todos.
class GetTodos {
  /// The todo repository
  final TodoRepository repository;
  
  /// Create a new get todos use case
  const GetTodos({required this.repository});
  
  /// Execute the use case
  ///
  /// Returns a list of todos if successful, or a failure if not.
  Future<Either<Failure, List<Todo>>> call() async {
    return await repository.getTodos();
  }
}
