import 'package:dartz/dartz.dart' hide Task;
import 'package:equatable/equatable.dart';
import '../entities/task.dart';
import '../repositories/task_repository.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';

/// GetTaskById Use Case
///
/// This use case retrieves a task by its ID from the repository.
class GetTaskById implements UseCase<Task, TaskParams> {
  final TaskRepository repository;

  /// Creates a new GetTaskById use case
  GetTaskById(this.repository);

  @override
  Future<Either<Failure, Task>> call(TaskParams params) {
    return repository.getTaskById(params.id);
  }
}

/// TaskParams
///
/// Parameters for the GetTaskById use case
class TaskParams extends Equatable {
  /// Task ID
  final String id;

  /// Creates a new TaskParams instance
  const TaskParams({required this.id});

  @override
  List<Object> get props => [id];
}
