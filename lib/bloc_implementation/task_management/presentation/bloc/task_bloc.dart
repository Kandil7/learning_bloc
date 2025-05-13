import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/create_task.dart';
import '../../domain/usecases/delete_task.dart';
import '../../domain/usecases/get_task_by_id.dart';
import '../../domain/usecases/get_tasks.dart';
import '../../domain/usecases/update_task.dart';
import '../../../../core/usecases/usecase.dart';
import 'task_event.dart';
import 'task_state.dart';

/// TaskBloc
///
/// This BLoC manages the state of tasks in the application.
/// It processes events and emits states based on the results of use cases.
class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final GetTasks getTasks;
  final GetTaskById getTaskById;
  final CreateTask createTask;
  final UpdateTask updateTask;
  final DeleteTask deleteTask;

  /// Creates a new TaskBloc instance
  TaskBloc({
    required this.getTasks,
    required this.getTaskById,
    required this.createTask,
    required this.updateTask,
    required this.deleteTask,
  }) : super(const TaskInitial()) {
    on<LoadTasksEvent>(_onLoadTasks);
    on<LoadTaskEvent>(_onLoadTask);
    on<CreateTaskEvent>(_onCreateTask);
    on<UpdateTaskEvent>(_onUpdateTask);
    on<DeleteTaskEvent>(_onDeleteTask);
    on<ToggleTaskEvent>(_onToggleTask);
  }

  /// Handle the LoadTasksEvent
  Future<void> _onLoadTasks(
    LoadTasksEvent event,
    Emitter<TaskState> emit,
  ) async {
    emit(const TaskLoading());
    final result = await getTasks(NoParams());
    result.fold(
      (failure) => emit(TaskOperationFailure(failure.message)),
      (tasks) => emit(TasksLoaded(tasks)),
    );
  }

  /// Handle the LoadTaskEvent
  Future<void> _onLoadTask(LoadTaskEvent event, Emitter<TaskState> emit) async {
    emit(const TaskLoading());
    final result = await getTaskById(TaskParams(id: event.id));
    result.fold(
      (failure) => emit(TaskOperationFailure(failure.message)),
      (task) => emit(TaskLoaded(task)),
    );
  }

  /// Handle the CreateTaskEvent
  Future<void> _onCreateTask(
    CreateTaskEvent event,
    Emitter<TaskState> emit,
  ) async {
    emit(const TaskLoading());
    final result = await createTask(CreateTaskParams(task: event.task));
    result.fold(
      (failure) => emit(TaskOperationFailure(failure.message)),
      (task) => emit(const TaskOperationSuccess('Task created successfully')),
    );
  }

  /// Handle the UpdateTaskEvent
  Future<void> _onUpdateTask(
    UpdateTaskEvent event,
    Emitter<TaskState> emit,
  ) async {
    emit(const TaskLoading());
    final result = await updateTask(UpdateTaskParams(task: event.task));
    result.fold(
      (failure) => emit(TaskOperationFailure(failure.message)),
      (task) => emit(const TaskOperationSuccess('Task updated successfully')),
    );
  }

  /// Handle the DeleteTaskEvent
  Future<void> _onDeleteTask(
    DeleteTaskEvent event,
    Emitter<TaskState> emit,
  ) async {
    emit(const TaskLoading());
    final result = await deleteTask(DeleteTaskParams(id: event.id));
    result.fold(
      (failure) => emit(TaskOperationFailure(failure.message)),
      (success) =>
          emit(const TaskOperationSuccess('Task deleted successfully')),
    );
  }

  /// Handle the ToggleTaskEvent
  Future<void> _onToggleTask(
    ToggleTaskEvent event,
    Emitter<TaskState> emit,
  ) async {
    emit(const TaskLoading());
    final toggledTask = event.task.copyWith(
      isCompleted: !event.task.isCompleted,
    );
    final result = await updateTask(UpdateTaskParams(task: toggledTask));
    result.fold(
      (failure) => emit(TaskOperationFailure(failure.message)),
      (task) =>
          emit(const TaskOperationSuccess('Task status toggled successfully')),
    );
  }
}
