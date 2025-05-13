import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/task_model.dart';
import '../../../../core/error/exceptions.dart';

/// Task Local Data Source
///
/// This class is responsible for accessing task data from local storage.
abstract class TaskLocalDataSource {
  /// Get all tasks from local storage
  Future<List<TaskModel>> getTasks();

  /// Get a task by ID from local storage
  Future<TaskModel> getTaskById(String id);

  /// Save a task to local storage
  Future<TaskModel> saveTask(TaskModel task);

  /// Update a task in local storage
  Future<TaskModel> updateTask(TaskModel task);

  /// Delete a task from local storage
  Future<bool> deleteTask(String id);
}

/// Implementation of [TaskLocalDataSource] using SharedPreferences
class TaskLocalDataSourceImpl implements TaskLocalDataSource {
  final SharedPreferences sharedPreferences;
  static const String tasksKey = 'TASKS_KEY';

  /// Creates a new TaskLocalDataSourceImpl instance
  TaskLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<TaskModel>> getTasks() async {
    final jsonString = sharedPreferences.getString(tasksKey);
    if (jsonString != null) {
      final List<dynamic> jsonList = json.decode(jsonString);
      return jsonList.map((json) => TaskModel.fromJson(json)).toList();
    } else {
      return [];
    }
  }

  @override
  Future<TaskModel> getTaskById(String id) async {
    final tasks = await getTasks();
    final task = tasks.firstWhere(
      (task) => task.id == id,
      orElse: () => throw CacheException(message: 'Task not found'),
    );
    return task;
  }

  @override
  Future<TaskModel> saveTask(TaskModel task) async {
    final tasks = await getTasks();
    tasks.add(task);
    await _saveTasks(tasks);
    return task;
  }

  @override
  Future<TaskModel> updateTask(TaskModel task) async {
    final tasks = await getTasks();
    final index = tasks.indexWhere((t) => t.id == task.id);
    if (index >= 0) {
      tasks[index] = task;
      await _saveTasks(tasks);
      return task;
    } else {
      throw CacheException(message: 'Task not found');
    }
  }

  @override
  Future<bool> deleteTask(String id) async {
    final tasks = await getTasks();
    final index = tasks.indexWhere((t) => t.id == id);
    if (index >= 0) {
      tasks.removeAt(index);
      await _saveTasks(tasks);
      return true;
    } else {
      throw CacheException(message: 'Task not found');
    }
  }

  /// Helper method to save tasks to SharedPreferences
  Future<void> _saveTasks(List<TaskModel> tasks) async {
    final jsonList = tasks.map((task) => task.toJson()).toList();
    final jsonString = json.encode(jsonList);
    await sharedPreferences.setString(tasksKey, jsonString);
  }
}
