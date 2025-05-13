import 'package:equatable/equatable.dart';
import '../../domain/entities/task.dart';

/// Base class for all task states
abstract class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object?> get props => [];
}

/// Initial state
class TaskInitial extends TaskState {
  const TaskInitial();
}

/// Loading state
class TaskLoading extends TaskState {
  const TaskLoading();
}

/// State when tasks are loaded successfully
class TasksLoaded extends TaskState {
  final List<Task> tasks;

  const TasksLoaded(this.tasks);

  @override
  List<Object?> get props => [tasks];
}

/// State when a single task is loaded successfully
class TaskLoaded extends TaskState {
  final Task task;

  const TaskLoaded(this.task);

  @override
  List<Object?> get props => [task];
}

/// State when a task operation is successful
class TaskOperationSuccess extends TaskState {
  final String message;

  const TaskOperationSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

/// State when a task operation fails
class TaskOperationFailure extends TaskState {
  final String message;

  const TaskOperationFailure(this.message);

  @override
  List<Object?> get props => [message];
}
