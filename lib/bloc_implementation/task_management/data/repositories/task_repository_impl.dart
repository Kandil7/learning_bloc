import 'package:dartz/dartz.dart' hide Task;
import '../../domain/entities/task.dart';
import '../../domain/repositories/task_repository.dart';
import '../datasources/task_local_data_source.dart';
import '../models/task_model.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';

/// Implementation of [TaskRepository]
///
/// This class implements the TaskRepository interface defined in the domain layer.
/// It uses the local data source to access task data.
class TaskRepositoryImpl implements TaskRepository {
  final TaskLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  /// Creates a new TaskRepositoryImpl instance
  TaskRepositoryImpl({
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Task>>> getTasks() async {
    try {
      final taskModels = await localDataSource.getTasks();
      // TaskModel already extends Task, so we can return it directly
      return Right(taskModels);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, Task>> getTaskById(String id) async {
    try {
      final task = await localDataSource.getTaskById(id);
      return Right(task);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, Task>> createTask(Task task) async {
    try {
      final taskModel = TaskModel.fromEntity(task);
      final createdTask = await localDataSource.saveTask(taskModel);
      return Right(createdTask);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, Task>> updateTask(Task task) async {
    try {
      final taskModel = TaskModel.fromEntity(task);
      final updatedTask = await localDataSource.updateTask(taskModel);
      return Right(updatedTask);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteTask(String id) async {
    try {
      final result = await localDataSource.deleteTask(id);
      return Right(result);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    }
  }
}
