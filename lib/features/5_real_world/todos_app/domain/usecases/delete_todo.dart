import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/error/failures.dart';
import '../repositories/todo_repository.dart';

/// Delete todo use case
///
/// This use case is responsible for deleting a todo.
/// It uses the TodoRepository to delete the todo.
class DeleteTodo {
  /// The todo repository
  final TodoRepository repository;
  
  /// Create a new delete todo use case
  const DeleteTodo({required this.repository});
  
  /// Execute the use case
  ///
  /// Returns void if successful, or a failure if not.
  Future<Either<Failure, void>> call(Params params) async {
    return await repository.deleteTodo(params.id);
  }
}

/// Parameters for the DeleteTodo use case
///
/// This class contains the parameters for the DeleteTodo use case.
class Params extends Equatable {
  /// The ID of the todo to delete
  final String id;
  
  /// Create new parameters
  const Params({required this.id});
  
  @override
  List<Object> get props => [id];
}
