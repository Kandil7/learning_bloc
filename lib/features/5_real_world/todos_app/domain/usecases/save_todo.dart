import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/error/failures.dart';
import '../entities/todo.dart';
import '../repositories/todo_repository.dart';

/// Save todo use case
///
/// This use case is responsible for saving a todo.
/// It uses the TodoRepository to save the todo.
class SaveTodo {
  /// The todo repository
  final TodoRepository repository;
  
  /// Create a new save todo use case
  const SaveTodo({required this.repository});
  
  /// Execute the use case
  ///
  /// Returns void if successful, or a failure if not.
  Future<Either<Failure, void>> call(Params params) async {
    return await repository.saveTodo(params.todo);
  }
}

/// Parameters for the SaveTodo use case
///
/// This class contains the parameters for the SaveTodo use case.
class Params extends Equatable {
  /// The todo to save
  final Todo todo;
  
  /// Create new parameters
  const Params({required this.todo});
  
  @override
  List<Object> get props => [todo];
}
