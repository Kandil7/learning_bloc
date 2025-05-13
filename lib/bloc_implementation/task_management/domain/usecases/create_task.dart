import 'package:dartz/dartz.dart' hide Task;
import 'package:equatable/equatable.dart';
import '../entities/task.dart';
import '../repositories/task_repository.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';

/// CreateTask Use Case
///
/// This use case creates a new task in the repository.
class CreateTask implements UseCase<Task, CreateTaskParams> {
  final TaskRepository repository;

  /// Creates a new CreateTask use case
  CreateTask(this.repository);

  @override
  Future<Either<Failure, Task>> call(CreateTaskParams params) {
    return repository.createTask(params.task);
  }
}

/// CreateTaskParams
///
/// Parameters for the CreateTask use case
class CreateTaskParams extends Equatable {
  /// Task to create
  final Task task;

  /// Creates a new CreateTaskParams instance
  const CreateTaskParams({required this.task});

  @override
  List<Object> get props => [task];
}
