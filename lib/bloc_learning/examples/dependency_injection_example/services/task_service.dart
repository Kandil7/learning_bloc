import 'package:learning_bloc/bloc_learning/examples/dependency_injection_example/repositories/task_repository.dart';

/// Task Service Interface
/// 
/// This abstract class defines the contract for task business operations.
abstract class TaskService {
  /// Get all tasks
  Future<List<Task>> getTasks();
  
  /// Create a new task
  Future<void> createTask(String title);
  
  /// Toggle task completion status
  Future<void> toggleTaskStatus(String id);
  
  /// Delete a task
  Future<void> deleteTask(String id);
}

/// Task Service Implementation
/// 
/// This class implements the TaskService interface.
/// It contains business logic for task operations.
class TaskServiceImpl implements TaskService {
  final TaskRepository _repository;
  
  /// Constructor that takes a TaskRepository dependency
  /// 
  /// This is where dependency injection happens - the repository
  /// is injected from outside rather than created inside.
  TaskServiceImpl(this._repository);
  
  @override
  Future<List<Task>> getTasks() async {
    return await _repository.getTasks();
  }
  
  @override
  Future<void> createTask(String title) async {
    // Create a new task with a unique ID
    final task = Task(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
    );
    
    await _repository.addTask(task);
  }
  
  @override
  Future<void> toggleTaskStatus(String id) async {
    // Get all tasks
    final tasks = await _repository.getTasks();
    
    // Find the task to update
    final task = tasks.firstWhere(
      (task) => task.id == id,
      orElse: () => throw Exception('Task not found'),
    );
    
    // Toggle the completion status
    final updatedTask = task.copyWith(isCompleted: !task.isCompleted);
    
    // Update the task
    await _repository.updateTask(updatedTask);
  }
  
  @override
  Future<void> deleteTask(String id) async {
    await _repository.deleteTask(id);
  }
}
