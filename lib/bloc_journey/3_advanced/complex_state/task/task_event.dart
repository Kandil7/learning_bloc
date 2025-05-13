import 'package:equatable/equatable.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/complex_state/models/task.dart';

/// Events for the TaskBloc
///
/// These events represent task-related actions.
sealed class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object?> get props => [];
}

/// Event to load all tasks
class LoadTasks extends TaskEvent {}

/// Event to load tasks by status
class LoadTasksByStatus extends TaskEvent {
  final TaskStatus status;

  const LoadTasksByStatus(this.status);

  @override
  List<Object?> get props => [status];
}

/// Event to load tasks by priority
class LoadTasksByPriority extends TaskEvent {
  final TaskPriority priority;

  const LoadTasksByPriority(this.priority);

  @override
  List<Object?> get props => [priority];
}

/// Event to load starred tasks
class LoadStarredTasks extends TaskEvent {}

/// Event to add a new task
class AddTask extends TaskEvent {
  final Task task;

  const AddTask(this.task);

  @override
  List<Object?> get props => [task];
}

/// Event to update an existing task
class UpdateTask extends TaskEvent {
  final Task task;

  const UpdateTask(this.task);

  @override
  List<Object?> get props => [task];
}

/// Event to delete a task
class DeleteTask extends TaskEvent {
  final String id;

  const DeleteTask(this.id);

  @override
  List<Object?> get props => [id];
}

/// Event to toggle the starred status of a task
class ToggleTaskStarred extends TaskEvent {
  final String id;

  const ToggleTaskStarred(this.id);

  @override
  List<Object?> get props => [id];
}

/// Event to update the status of a task
class UpdateTaskStatus extends TaskEvent {
  final String id;
  final TaskStatus status;

  const UpdateTaskStatus(this.id, this.status);

  @override
  List<Object?> get props => [id, status];
}
