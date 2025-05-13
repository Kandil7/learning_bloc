import 'package:equatable/equatable.dart';

/// Task entity
///
/// Represents a task in the application domain.
/// This is a core business object that is independent of any data layer implementation.
class Task extends Equatable {
  /// Unique identifier for the task
  final String id;

  /// Title of the task
  final String title;

  /// Description of the task (optional)
  final String description;

  /// Whether the task is completed
  final bool isCompleted;

  /// Creation date of the task
  final DateTime createdAt;

  /// Due date of the task (optional)
  final DateTime? dueDate;

  /// Creates a new Task instance
  const Task({
    required this.id,
    required this.title,
    this.description = '',
    this.isCompleted = false,
    required this.createdAt,
    this.dueDate,
  });

  /// Creates a copy of this Task with the given fields replaced with new values
  Task copyWith({
    String? id,
    String? title,
    String? description,
    bool? isCompleted,
    DateTime? createdAt,
    DateTime? dueDate,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      createdAt: createdAt ?? this.createdAt,
      dueDate: dueDate ?? this.dueDate,
    );
  }

  @override
  List<Object?> get props => [id, title, description, isCompleted, createdAt, dueDate];
}
