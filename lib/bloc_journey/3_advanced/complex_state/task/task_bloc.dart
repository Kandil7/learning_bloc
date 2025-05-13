import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/complex_state/data/task_repository.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/complex_state/models/task.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/complex_state/task/task_event.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/complex_state/task/task_state.dart';

/// BLoC for task management
///
/// This BLoC handles complex task state management.
class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository taskRepository;

  /// Initialize the BLoC with the initial state and repository
  TaskBloc({required this.taskRepository}) : super(TaskState.initial()) {
    // Register event handlers
    on<LoadTasks>(_onLoadTasks);
    on<LoadTasksByStatus>(_onLoadTasksByStatus);
    on<LoadTasksByPriority>(_onLoadTasksByPriority);
    on<LoadStarredTasks>(_onLoadStarredTasks);
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
    on<ToggleTaskStarred>(_onToggleTaskStarred);
    on<UpdateTaskStatus>(_onUpdateTaskStatus);
  }

  /// Handle the load tasks event
  void _onLoadTasks(LoadTasks event, Emitter<TaskState> emit) async {
    emit(state.loading());

    try {
      final tasks = await taskRepository.getTasks();
      emit(state.loaded(tasks).copyWith(
            filterStatus: null,
            filterPriority: null,
            onlyStarred: false,
            currentView: TaskView.all,
          ));
    } catch (e) {
      emit(state.withError(e.toString()));
    }
  }

  /// Handle the load tasks by status event
  void _onLoadTasksByStatus(
      LoadTasksByStatus event, Emitter<TaskState> emit) async {
    emit(state.loading());

    try {
      final tasks = await taskRepository.getTasksByStatus(event.status);
      emit(state.loaded(tasks).copyWith(
            filterStatus: event.status,
            filterPriority: null,
            onlyStarred: false,
            currentView: TaskView.byStatus,
          ));
    } catch (e) {
      emit(state.withError(e.toString()));
    }
  }

  /// Handle the load tasks by priority event
  void _onLoadTasksByPriority(
      LoadTasksByPriority event, Emitter<TaskState> emit) async {
    emit(state.loading());

    try {
      final tasks = await taskRepository.getTasksByPriority(event.priority);
      emit(state.loaded(tasks).copyWith(
            filterStatus: null,
            filterPriority: event.priority,
            onlyStarred: false,
            currentView: TaskView.byPriority,
          ));
    } catch (e) {
      emit(state.withError(e.toString()));
    }
  }

  /// Handle the load starred tasks event
  void _onLoadStarredTasks(
      LoadStarredTasks event, Emitter<TaskState> emit) async {
    emit(state.loading());

    try {
      final tasks = await taskRepository.getStarredTasks();
      emit(state.loaded(tasks).copyWith(
            filterStatus: null,
            filterPriority: null,
            onlyStarred: true,
            currentView: TaskView.starred,
          ));
    } catch (e) {
      emit(state.withError(e.toString()));
    }
  }

  /// Handle the add task event
  void _onAddTask(AddTask event, Emitter<TaskState> emit) async {
    emit(state.loading());

    try {
      await taskRepository.addTask(event.task);

      // Reload tasks based on current view
      await _reloadTasksBasedOnCurrentView(emit);
    } catch (e) {
      emit(state.withError(e.toString()));
    }
  }

  /// Handle the update task event
  void _onUpdateTask(UpdateTask event, Emitter<TaskState> emit) async {
    emit(state.loading());

    try {
      await taskRepository.updateTask(event.task);

      // Reload tasks based on current view
      await _reloadTasksBasedOnCurrentView(emit);
    } catch (e) {
      emit(state.withError(e.toString()));
    }
  }

  /// Handle the delete task event
  void _onDeleteTask(DeleteTask event, Emitter<TaskState> emit) async {
    emit(state.loading());

    try {
      await taskRepository.deleteTask(event.id);

      // Reload tasks based on current view
      await _reloadTasksBasedOnCurrentView(emit);
    } catch (e) {
      emit(state.withError(e.toString()));
    }
  }

  /// Handle the toggle task starred event
  void _onToggleTaskStarred(
      ToggleTaskStarred event, Emitter<TaskState> emit) async {
    try {
      await taskRepository.toggleStarred(event.id);

      // Reload tasks based on current view
      await _reloadTasksBasedOnCurrentView(emit);
    } catch (e) {
      emit(state.withError(e.toString()));
    }
  }

  /// Handle the update task status event
  void _onUpdateTaskStatus(
      UpdateTaskStatus event, Emitter<TaskState> emit) async {
    try {
      await taskRepository.updateTaskStatus(event.id, event.status);

      // Reload tasks based on current view
      await _reloadTasksBasedOnCurrentView(emit);
    } catch (e) {
      emit(state.withError(e.toString()));
    }
  }

  /// Helper method to reload tasks based on the current view
  Future<void> _reloadTasksBasedOnCurrentView(Emitter<TaskState> emit) async {
    final currentView = state.currentView;

    switch (currentView) {
      case TaskView.all:
        final tasks = await taskRepository.getTasks();
        emit(state.loaded(tasks));
        break;
      case TaskView.byStatus:
        if (state.filterStatus != null) {
          final tasks =
              await taskRepository.getTasksByStatus(state.filterStatus!);
          emit(state.loaded(tasks));
        }
        break;
      case TaskView.byPriority:
        if (state.filterPriority != null) {
          final tasks =
              await taskRepository.getTasksByPriority(state.filterPriority!);
          emit(state.loaded(tasks));
        }
        break;
      case TaskView.starred:
        final tasks = await taskRepository.getStarredTasks();
        emit(state.loaded(tasks));
        break;
    }
  }
}
