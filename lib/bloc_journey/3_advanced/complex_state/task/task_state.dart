import 'package:equatable/equatable.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/complex_state/models/task.dart';

/// State for the TaskBloc
///
/// This state represents the different states of task data.
class TaskState extends Equatable {
  final List<Task> tasks;
  final TaskStatus? filterStatus;
  final TaskPriority? filterPriority;
  final bool onlyStarred;
  final bool isLoading;
  final String? error;
  final TaskView currentView;

  /// Constructor for TaskState
  const TaskState({
    this.tasks = const [],
    this.filterStatus,
    this.filterPriority,
    this.onlyStarred = false,
    this.isLoading = false,
    this.error,
    this.currentView = TaskView.all,
  });

  /// Initial state
  factory TaskState.initial() {
    return const TaskState();
  }

  /// Loading state
  TaskState loading() {
    return copyWith(isLoading: true, error: null);
  }

  /// Loaded state
  TaskState loaded(List<Task> tasks) {
    return copyWith(tasks: tasks, isLoading: false, error: null);
  }

  /// Error state
  TaskState withError(String message) {
    return copyWith(error: message, isLoading: false);
  }

  /// Create a copy of this state with the given fields replaced
  TaskState copyWith({
    List<Task>? tasks,
    TaskStatus? filterStatus,
    TaskPriority? filterPriority,
    bool? onlyStarred,
    bool? isLoading,
    String? error,
    TaskView? currentView,
  }) {
    return TaskState(
      tasks: tasks ?? this.tasks,
      filterStatus: filterStatus,
      filterPriority: filterPriority,
      onlyStarred: onlyStarred ?? this.onlyStarred,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      currentView: currentView ?? this.currentView,
    );
  }

  /// Get filtered tasks based on current filters
  List<Task> get filteredTasks {
    List<Task> result = List.from(tasks);

    // Apply status filter
    if (filterStatus != null) {
      result = result.where((task) => task.status == filterStatus).toList();
    }

    // Apply priority filter
    if (filterPriority != null) {
      result = result.where((task) => task.priority == filterPriority).toList();
    }

    // Apply starred filter
    if (onlyStarred) {
      result = result.where((task) => task.isStarred).toList();
    }

    return result;
  }

  @override
  List<Object?> get props => [
        tasks,
        filterStatus,
        filterPriority,
        onlyStarred,
        isLoading,
        error,
        currentView,
      ];
}

/// Task view options
enum TaskView { all, byStatus, byPriority, starred }
