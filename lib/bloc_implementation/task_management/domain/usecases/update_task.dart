import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../entities/task.dart';
import '../repositories/task_repository.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';

/// UpdateTask Use Case
///
/// This use case updates an existing task in the repository.
class UpdateTask implements UseCase<Task, UpdateTaskParams> {
  final TaskRepository repository;

  /// Creates a new UpdateTask use case
  UpdateTask(this.repository);

  @override
  Future<Either<Failure, Task>> call(UpdateTaskParams params) {
    return repository.updateTask(params.task);
  }
}

/// UpdateTaskParams
///
/// Parameters for the UpdateTask use case
class UpdateTaskParams extends Equatable {
  /// Task to update
  final Task task;

  /// Creates a new UpdateTaskParams instance
  const UpdateTaskParams({required this.task});

  @override
  List<Object> get props => [task];
}
