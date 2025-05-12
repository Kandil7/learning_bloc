import 'package:equatable/equatable.dart';
import '../../domain/entities/todo.dart';

/// Base class for all todo states
///
/// This abstract class is extended by all todo states.
abstract class TodoState extends Equatable {
  const TodoState();
  
  @override
  List<Object> get props => [];
}

/// Initial todo state
///
/// This state is the initial state of the todo BLoC.
class TodoInitial extends TodoState {}

/// Loading todos state
///
/// This state is emitted when todos are being loaded.
class TodosLoading extends TodoState {}

/// Loaded todos state
///
/// This state is emitted when todos have been loaded successfully.
class TodosLoaded extends TodoState {
  /// The list of todos
  final List<Todo> todos;
  
  /// Create a new todos loaded state
  const TodosLoaded(this.todos);
  
  @override
  List<Object> get props => [todos];
}

/// Error state
///
/// This state is emitted when there is an error.
class TodosError extends TodoState {
  /// The error message
  final String message;
  
  /// Create a new todos error state
  const TodosError(this.message);
  
  @override
  List<Object> get props => [message];
}

/// Operation success state
///
/// This state is emitted when an operation has been completed successfully.
class TodoOperationSuccess extends TodoState {
  /// The success message
  final String message;
  
  /// Create a new todo operation success state
  const TodoOperationSuccess(this.message);
  
  @override
  List<Object> get props => [message];
}
