import 'package:equatable/equatable.dart';
import '../../domain/entities/todo.dart';

/// Base class for all todo events
///
/// This abstract class is extended by all todo events.
abstract class TodoEvent extends Equatable {
  const TodoEvent();
  
  @override
  List<Object> get props => [];
}

/// Event to load todos
///
/// This event is dispatched when the user wants to load all todos.
class LoadTodosEvent extends TodoEvent {
  const LoadTodosEvent();
}

/// Event to add a todo
///
/// This event is dispatched when the user wants to add a todo.
class AddTodoEvent extends TodoEvent {
  /// The todo to add
  final Todo todo;
  
  /// Create a new add todo event
  const AddTodoEvent(this.todo);
  
  @override
  List<Object> get props => [todo];
}

/// Event to delete a todo
///
/// This event is dispatched when the user wants to delete a todo.
class DeleteTodoEvent extends TodoEvent {
  /// The ID of the todo to delete
  final String id;
  
  /// Create a new delete todo event
  const DeleteTodoEvent(this.id);
  
  @override
  List<Object> get props => [id];
}

/// Event to update a todo
///
/// This event is dispatched when the user wants to update a todo.
class UpdateTodoEvent extends TodoEvent {
  /// The todo to update
  final Todo todo;
  
  /// Create a new update todo event
  const UpdateTodoEvent(this.todo);
  
  @override
  List<Object> get props => [todo];
}

/// Event to toggle a todo's completion status
///
/// This event is dispatched when the user wants to toggle a todo's completion status.
class ToggleTodoEvent extends TodoEvent {
  /// The todo to toggle
  final Todo todo;
  
  /// Create a new toggle todo event
  const ToggleTodoEvent(this.todo);
  
  @override
  List<Object> get props => [todo];
}
