import '../../domain/entities/todo.dart';

/// Todo model
///
/// This class is a model of the Todo entity for the data layer.
/// It extends the Todo entity and adds JSON serialization/deserialization.
class TodoModel extends Todo {
  /// Create a new todo model
  const TodoModel({
    required String id,
    required String title,
    required String description,
    bool isCompleted = false,
  }) : super(
          id: id,
          title: title,
          description: description,
          isCompleted: isCompleted,
        );
  
  /// Create a todo model from a JSON map
  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      isCompleted: json['isCompleted'],
    );
  }
  
  /// Convert the todo model to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isCompleted': isCompleted,
    };
  }
  
  /// Create a todo model from a Todo entity
  factory TodoModel.fromEntity(Todo todo) {
    return TodoModel(
      id: todo.id,
      title: todo.title,
      description: todo.description,
      isCompleted: todo.isCompleted,
    );
  }
}
