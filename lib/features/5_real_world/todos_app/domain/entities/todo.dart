import 'package:equatable/equatable.dart';

/// Todo entity
///
/// This class represents a todo entity in the domain layer.
/// It contains the basic properties of a todo.
class Todo extends Equatable {
  /// The unique identifier of the todo
  final String id;
  
  /// The title of the todo
  final String title;
  
  /// The description of the todo
  final String description;
  
  /// Whether the todo is completed
  final bool isCompleted;
  
  /// Create a new todo entity
  const Todo({
    required this.id,
    required this.title,
    required this.description,
    this.isCompleted = false,
  });
  
  @override
  List<Object> get props => [id, title, description, isCompleted];
  
  /// Create a copy of this todo with the given properties
  Todo copyWith({
    String? id,
    String? title,
    String? description,
    bool? isCompleted,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
