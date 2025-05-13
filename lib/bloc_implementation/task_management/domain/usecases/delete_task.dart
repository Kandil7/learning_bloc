import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../repositories/task_repository.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';

/// DeleteTask Use Case
///
/// This use case deletes a task from the repository by its ID.
class DeleteTask implements UseCase<bool, DeleteTaskParams> {
  final TaskRepository repository;

  /// Creates a new DeleteTask use case
  DeleteTask(this.repository);

  @override
  Future<Either<Failure, bool>> call(DeleteTaskParams params) {
    return repository.deleteTask(params.id);
  }
}

/// DeleteTaskParams
///
/// Parameters for the DeleteTask use case
class DeleteTaskParams extends Equatable {
  /// Task ID to delete
  final String id;

  /// Creates a new DeleteTaskParams instance
  const DeleteTaskParams({required this.id});

  @override
  List<Object> get props => [id];
}
