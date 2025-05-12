import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/error/exceptions.dart';
import '../models/todo_model.dart';

/// Todo local data source
///
/// This class is responsible for storing and retrieving todos from local storage.
abstract class TodoLocalDataSource {
  /// Get all todos
  ///
  /// Returns a list of todo models.
  /// Throws a CacheException if there is a cache error.
  Future<List<TodoModel>> getTodos();
  
  /// Save todos
  ///
  /// Saves a list of todo models.
  /// Throws a CacheException if there is a cache error.
  Future<void> saveTodos(List<TodoModel> todos);
}

/// Implementation of the todo local data source
class TodoLocalDataSourceImpl implements TodoLocalDataSource {
  /// The shared preferences instance
  final SharedPreferences sharedPreferences;
  
  /// Create a new todo local data source implementation
  TodoLocalDataSourceImpl({required this.sharedPreferences});
  
  /// The key for storing todos in shared preferences
  static const String todosKey = 'todos';
  
  @override
  Future<List<TodoModel>> getTodos() async {
    try {
      final jsonString = sharedPreferences.getString(todosKey);
      if (jsonString != null) {
        final List<dynamic> jsonList = json.decode(jsonString);
        return jsonList.map((json) => TodoModel.fromJson(json)).toList();
      }
      return [];
    } catch (e) {
      throw CacheException();
    }
  }
  
  @override
  Future<void> saveTodos(List<TodoModel> todos) async {
    try {
      final jsonList = todos.map((todo) => todo.toJson()).toList();
      await sharedPreferences.setString(todosKey, json.encode(jsonList));
    } catch (e) {
      throw CacheException();
    }
  }
}
