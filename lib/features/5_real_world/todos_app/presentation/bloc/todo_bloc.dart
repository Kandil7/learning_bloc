import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/todo.dart';
import '../../domain/usecases/delete_todo.dart' as delete;
import '../../domain/usecases/get_todos.dart';
import '../../domain/usecases/save_todo.dart' as save;
import '../../domain/usecases/update_todo.dart' as update;
import 'todo_event.dart';
import 'todo_state.dart';

/// Todo BLoC
///
/// This BLoC handles the business logic for the todo feature.
/// It processes events and emits new states.
class TodoBloc extends Bloc<TodoEvent, TodoState> {
  /// The get todos use case
  final GetTodos getTodos;
  
  /// The save todo use case
  final save.SaveTodo saveTodo;
  
  /// The delete todo use case
  final delete.DeleteTodo deleteTodo;
  
  /// The update todo use case
  final update.UpdateTodo updateTodo;
  
  /// Create a new todo BLoC
  TodoBloc({
    required this.getTodos,
    required this.saveTodo,
    required this.deleteTodo,
    required this.updateTodo,
  }) : super(TodoInitial()) {
    on<LoadTodosEvent>(_onLoadTodos);
    on<AddTodoEvent>(_onAddTodo);
    on<DeleteTodoEvent>(_onDeleteTodo);
    on<UpdateTodoEvent>(_onUpdateTodo);
    on<ToggleTodoEvent>(_onToggleTodo);
  }
  
  /// Handle the load todos event
  ///
  /// Loads todos and emits a new state
  void _onLoadTodos(LoadTodosEvent event, Emitter<TodoState> emit) async {
    emit(TodosLoading());
    
    final result = await getTodos();
    
    result.fold(
      (failure) => emit(const TodosError('Failed to load todos')),
      (todos) => emit(TodosLoaded(todos)),
    );
  }
  
  /// Handle the add todo event
  ///
  /// Adds a todo and emits a new state
  void _onAddTodo(AddTodoEvent event, Emitter<TodoState> emit) async {
    emit(TodosLoading());
    
    final result = await saveTodo(save.Params(todo: event.todo));
    
    result.fold(
      (failure) => emit(const TodosError('Failed to add todo')),
      (_) async {
        final todosResult = await getTodos();
        todosResult.fold(
          (failure) => emit(const TodosError('Failed to load todos')),
          (todos) => emit(TodosLoaded(todos)),
        );
      },
    );
  }
  
  /// Handle the delete todo event
  ///
  /// Deletes a todo and emits a new state
  void _onDeleteTodo(DeleteTodoEvent event, Emitter<TodoState> emit) async {
    emit(TodosLoading());
    
    final result = await deleteTodo(delete.Params(id: event.id));
    
    result.fold(
      (failure) => emit(const TodosError('Failed to delete todo')),
      (_) async {
        final todosResult = await getTodos();
        todosResult.fold(
          (failure) => emit(const TodosError('Failed to load todos')),
          (todos) => emit(TodosLoaded(todos)),
        );
      },
    );
  }
  
  /// Handle the update todo event
  ///
  /// Updates a todo and emits a new state
  void _onUpdateTodo(UpdateTodoEvent event, Emitter<TodoState> emit) async {
    emit(TodosLoading());
    
    final result = await updateTodo(update.Params(todo: event.todo));
    
    result.fold(
      (failure) => emit(const TodosError('Failed to update todo')),
      (_) async {
        final todosResult = await getTodos();
        todosResult.fold(
          (failure) => emit(const TodosError('Failed to load todos')),
          (todos) => emit(TodosLoaded(todos)),
        );
      },
    );
  }
  
  /// Handle the toggle todo event
  ///
  /// Toggles a todo's completion status and emits a new state
  void _onToggleTodo(ToggleTodoEvent event, Emitter<TodoState> emit) async {
    emit(TodosLoading());
    
    final toggledTodo = event.todo.copyWith(
      isCompleted: !event.todo.isCompleted,
    );
    
    final result = await updateTodo(update.Params(todo: toggledTodo));
    
    result.fold(
      (failure) => emit(const TodosError('Failed to toggle todo')),
      (_) async {
        final todosResult = await getTodos();
        todosResult.fold(
          (failure) => emit(const TodosError('Failed to load todos')),
          (todos) => emit(TodosLoaded(todos)),
        );
      },
    );
  }
}
