import 'package:equatable/equatable.dart';
import '../../domain/entities/task.dart';

/// Base class for all task events
abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object?> get props => [];
}

/// Event to load all tasks
class LoadTasksEvent extends TaskEvent {
  const LoadTasksEvent();
}

/// Event to load a specific task by ID
class LoadTaskEvent extends TaskEvent {
  final String id;

  const LoadTaskEvent(this.id);

  @override
  List<Object?> get props => [id];
}

/// Event to create a new task
class CreateTaskEvent extends TaskEvent {
  final Task task;

  const CreateTaskEvent(this.task);

  @override
  List<Object?> get props => [task];
}

/// Event to update an existing task
class UpdateTaskEvent extends TaskEvent {
  final Task task;

  const UpdateTaskEvent(this.task);

  @override
  List<Object?> get props => [task];
}

/// Event to delete a task
class DeleteTaskEvent extends TaskEvent {
  final String id;

  const DeleteTaskEvent(this.id);

  @override
  List<Object?> get props => [id];
}

/// Event to toggle task completion status
class ToggleTaskEvent extends TaskEvent {
  final Task task;

  const ToggleTaskEvent(this.task);

  @override
  List<Object?> get props => [task];
}
