import 'dart:math';

import 'package:flutter_mastery/bloc_journey/3_advanced/complex_state/models/task.dart';

/// Task Repository
///
/// This repository provides methods to fetch and manipulate tasks.
/// It simulates a data source with in-memory storage.
class TaskRepository {
  // In-memory storage for tasks
  final List<Task> _tasks = [];

  // Random generator for IDs
  final _random = Random();

  /// Constructor that initializes with some sample tasks
  TaskRepository() {
    // Add some sample tasks
    _addSampleTasks();
  }

  /// Get all tasks
  Future<List<Task>> getTasks() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    return _tasks;
  }

  /// Get tasks filtered by status
  Future<List<Task>> getTasksByStatus(TaskStatus status) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 300));
    return _tasks.where((task) => task.status == status).toList();
  }

  /// Get tasks filtered by priority
  Future<List<Task>> getTasksByPriority(TaskPriority priority) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 300));
    return _tasks.where((task) => task.priority == priority).toList();
  }

  /// Get starred tasks
  Future<List<Task>> getStarredTasks() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 300));
    return _tasks.where((task) => task.isStarred).toList();
  }

  /// Add a new task
  Future<Task> addTask(Task task) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    
    // Generate a random ID if not provided
    final newTask = task.id.isEmpty
        ? task.copyWith(id: _generateId())
        : task;
    
    // Add the task to the list
    _tasks.add(newTask);
    
    return newTask;
  }

  /// Update an existing task
  Future<Task> updateTask(Task task) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    
    // Find the task index
    final index = _tasks.indexWhere((t) => t.id == task.id);
    
    if (index >= 0) {
      // Replace the task
      _tasks[index] = task;
      return task;
    } else {
      throw Exception('Task not found');
    }
  }

  /// Delete a task
  Future<void> deleteTask(String id) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    
    // Remove the task
    _tasks.removeWhere((task) => task.id == id);
  }

  /// Toggle the starred status of a task
  Future<Task> toggleStarred(String id) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 300));
    
    // Find the task index
    final index = _tasks.indexWhere((t) => t.id == id);
    
    if (index >= 0) {
      // Toggle the starred status
      final task = _tasks[index];
      final updatedTask = task.copyWith(isStarred: !task.isStarred);
      _tasks[index] = updatedTask;
      return updatedTask;
    } else {
      throw Exception('Task not found');
    }
  }

  /// Update the status of a task
  Future<Task> updateTaskStatus(String id, TaskStatus status) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 300));
    
    // Find the task index
    final index = _tasks.indexWhere((t) => t.id == id);
    
    if (index >= 0) {
      // Update the status
      final task = _tasks[index];
      final updatedTask = task.copyWith(status: status);
      _tasks[index] = updatedTask;
      return updatedTask;
    } else {
      throw Exception('Task not found');
    }
  }

  /// Generate a random ID
  String _generateId() {
    return 'task_${_random.nextInt(10000)}';
  }

  /// Add sample tasks for demonstration
  void _addSampleTasks() {
    _tasks.addAll([
      Task(
        id: 'task_1',
        title: 'Complete BLoC tutorial',
        description: 'Finish the BLoC pattern tutorial and implement examples',
        dueDate: DateTime.now().add(const Duration(days: 2)),
        priority: TaskPriority.high,
        status: TaskStatus.inProgress,
        tags: ['flutter', 'bloc', 'learning'],
        isStarred: true,
      ),
      Task(
        id: 'task_2',
        title: 'Buy groceries',
        description: 'Milk, eggs, bread, fruits',
        dueDate: DateTime.now().add(const Duration(days: 1)),
        priority: TaskPriority.medium,
        status: TaskStatus.todo,
        tags: ['personal', 'shopping'],
        isStarred: false,
      ),
      Task(
        id: 'task_3',
        title: 'Gym workout',
        description: 'Cardio and strength training',
        dueDate: DateTime.now(),
        priority: TaskPriority.low,
        status: TaskStatus.todo,
        tags: ['health', 'personal'],
        isStarred: true,
      ),
      Task(
        id: 'task_4',
        title: 'Read Clean Architecture book',
        description: 'Finish chapters 5-8',
        dueDate: DateTime.now().add(const Duration(days: 5)),
        priority: TaskPriority.medium,
        status: TaskStatus.todo,
        tags: ['learning', 'books'],
        isStarred: false,
      ),
      Task(
        id: 'task_5',
        title: 'Fix app navigation bug',
        description: 'The back button is not working correctly',
        dueDate: DateTime.now().add(const Duration(days: 1)),
        priority: TaskPriority.high,
        status: TaskStatus.todo,
        tags: ['work', 'bug', 'flutter'],
        isStarred: false,
      ),
    ]);
  }
}
