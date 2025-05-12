import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/error/failures.dart';
import '../entities/todo.dart';
import '../repositories/todo_repository.dart';

/// Update todo use case
///
/// This use case is responsible for updating a todo.
/// It uses the TodoRepository to update the todo.
class UpdateTodo {
  /// The todo repository
  final TodoRepository repository;
  
  /// Create a new update todo use case
  const UpdateTodo({required this.repository});
  
  /// Execute the use case
  ///
  /// Returns void if successful, or a failure if not.
  Future<Either<Failure, void>> call(Params params) async {
    return await repository.updateTodo(params.todo);
  }
}

/// Parameters for the UpdateTodo use case
///
/// This class contains the parameters for the UpdateTodo use case.
class Params extends Equatable {
  /// The todo to update
  final Todo todo;
  
  /// Create new parameters
  const Params({required this.todo});
  
  @override
  List<Object> get props => [todo];
}
