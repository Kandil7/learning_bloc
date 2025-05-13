import 'package:dartz/dartz.dart' hide Task;
import '../entities/task.dart';
import '../repositories/task_repository.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';

/// GetTasks Use Case
///
/// This use case retrieves all tasks from the repository.
class GetTasks implements UseCase<List<Task>, NoParams> {
  final TaskRepository repository;

  /// Creates a new GetTasks use case
  GetTasks(this.repository);

  @override
  Future<Either<Failure, List<Task>>> call(NoParams params) {
    return repository.getTasks();
  }
}
