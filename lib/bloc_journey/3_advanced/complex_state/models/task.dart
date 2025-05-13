import 'package:equatable/equatable.dart';

/// Task priority levels
enum TaskPriority { low, medium, high }

/// Task status options
enum TaskStatus { todo, inProgress, done }

/// Task model
///
/// This class represents a task with various properties.
class Task extends Equatable {
  final String id;
  final String title;
  final String description;
  final DateTime dueDate;
  final TaskPriority priority;
  final TaskStatus status;
  final List<String> tags;
  final bool isStarred;

  /// Constructor for Task
  const Task({
    required this.id,
    required this.title,
    required this.description,
    required this.dueDate,
    required this.priority,
    required this.status,
    required this.tags,
    required this.isStarred,
  });

  /// Create a copy of this task with the given fields replaced
  Task copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? dueDate,
    TaskPriority? priority,
    TaskStatus? status,
    List<String>? tags,
    bool? isStarred,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      dueDate: dueDate ?? this.dueDate,
      priority: priority ?? this.priority,
      status: status ?? this.status,
      tags: tags ?? this.tags,
      isStarred: isStarred ?? this.isStarred,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        dueDate,
        priority,
        status,
        tags,
        isStarred,
      ];
}
