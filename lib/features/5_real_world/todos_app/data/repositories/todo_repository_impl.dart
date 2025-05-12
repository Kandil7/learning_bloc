import 'package:dartz/dartz.dart';
import '../../../../../core/error/exceptions.dart';
import '../../../../../core/error/failures.dart';
import '../../domain/entities/todo.dart';
import '../../domain/repositories/todo_repository.dart';
import '../datasources/todo_local_data_source.dart';
import '../models/todo_model.dart';

/// Implementation of the todo repository
///
/// This class implements the TodoRepository interface from the domain layer.
/// It uses the TodoLocalDataSource to store and retrieve todos from local storage.
class TodoRepositoryImpl implements TodoRepository {
  /// The todo local data source
  final TodoLocalDataSource localDataSource;
  
  /// Create a new todo repository implementation
  TodoRepositoryImpl({required this.localDataSource});
  
  @override
  Future<Either<Failure, List<Todo>>> getTodos() async {
    try {
      final todos = await localDataSource.getTodos();
      return Right(todos);
    } on CacheException {
      return const Left(CacheFailure());
    }
  }
  
  @override
  Future<Either<Failure, void>> saveTodo(Todo todo) async {
    try {
      final todos = await localDataSource.getTodos();
      final todoModel = TodoModel.fromEntity(todo);
      todos.add(todoModel);
      await localDataSource.saveTodos(todos);
      return const Right(null);
    } on CacheException {
      return const Left(CacheFailure());
    }
  }
  
  @override
  Future<Either<Failure, void>> deleteTodo(String id) async {
    try {
      final todos = await localDataSource.getTodos();
      final filteredTodos = todos.where((todo) => todo.id != id).toList();
      await localDataSource.saveTodos(filteredTodos);
      return const Right(null);
    } on CacheException {
      return const Left(CacheFailure());
    }
  }
  
  @override
  Future<Either<Failure, void>> updateTodo(Todo todo) async {
    try {
      final todos = await localDataSource.getTodos();
      final todoModel = TodoModel.fromEntity(todo);
      final index = todos.indexWhere((t) => t.id == todo.id);
      
      if (index != -1) {
        todos[index] = todoModel;
        await localDataSource.saveTodos(todos);
        return const Right(null);
      } else {
        return const Left(CacheFailure());
      }
    } on CacheException {
      return const Left(CacheFailure());
    }
  }
}
