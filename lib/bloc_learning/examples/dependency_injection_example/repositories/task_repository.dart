import 'package:equatable/equatable.dart';

/// Task model
class Task extends Equatable {
  final String id;
  final String title;
  final bool isCompleted;

  const Task({
    required this.id,
    required this.title,
    this.isCompleted = false,
  });

  Task copyWith({
    String? id,
    String? title,
    bool? isCompleted,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  List<Object> get props => [id, title, isCompleted];
}

/// Task Repository Interface
/// 
/// This abstract class defines the contract for task data operations.
abstract class TaskRepository {
  /// Get all tasks
  Future<List<Task>> getTasks();
  
  /// Add a new task
  Future<void> addTask(Task task);
  
  /// Update an existing task
  Future<void> updateTask(Task task);
  
  /// Delete a task
  Future<void> deleteTask(String id);
}

/// Task Repository Implementation
/// 
/// This class implements the TaskRepository interface.
/// In a real app, this would interact with a database or API.
class TaskRepositoryImpl implements TaskRepository {
  // In-memory storage for tasks
  final List<Task> _tasks = [];
  
  @override
  Future<List<Task>> getTasks() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    return [..._tasks];
  }
  
  @override
  Future<void> addTask(Task task) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    _tasks.add(task);
  }
  
  @override
  Future<void> updateTask(Task task) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    
    final index = _tasks.indexWhere((t) => t.id == task.id);
    if (index != -1) {
      _tasks[index] = task;
    }
  }
  
  @override
  Future<void> deleteTask(String id) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    
    _tasks.removeWhere((task) => task.id == id);
  }
}
