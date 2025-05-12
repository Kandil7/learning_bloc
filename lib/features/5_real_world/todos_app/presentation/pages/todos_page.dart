import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/datasources/todo_local_data_source.dart';
import '../../data/repositories/todo_repository_impl.dart';
import '../../domain/repositories/todo_repository.dart';
import '../../domain/usecases/delete_todo.dart';
import '../../domain/usecases/get_todos.dart';
import '../../domain/usecases/save_todo.dart';
import '../../domain/usecases/update_todo.dart';
import '../bloc/todo_bloc.dart';
import 'todo_list_page.dart';

/// Todos page
///
/// This page demonstrates how to create a todo list application
/// using the BLoC pattern and Clean Architecture.
class TodosPage extends StatelessWidget {
  /// Create a new todos page
  const TodosPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos App'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildExplanation(),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  final todoBloc = await _createTodoBloc();
                  
                  if (context.mounted) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(
                          create: (context) => todoBloc,
                          child: const TodoListPage(),
                        ),
                      ),
                    );
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'Open Todos App',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  /// Build the explanation widget
  Widget _buildExplanation() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Todos App Example',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'This example demonstrates how to create a todo list application using the BLoC pattern and Clean Architecture:',
            ),
            SizedBox(height: 8),
            Text('• Implements CRUD operations (Create, Read, Update, Delete)'),
            Text('• Uses shared_preferences for local storage'),
            Text('• Implements BLoC for state management'),
            Text('• Follows Clean Architecture principles'),
            SizedBox(height: 8),
            Text(
              'The app is structured following Clean Architecture:',
            ),
            Text('• Domain Layer: Todo entity, TodoRepository interface, use cases'),
            Text('• Data Layer: TodoModel, TodoLocalDataSource, TodoRepositoryImpl'),
            Text('• Presentation Layer: TodoBloc, TodoEvent, TodoState, UI components'),
          ],
        ),
      ),
    );
  }
  
  /// Create a todo BLoC with all dependencies
  Future<TodoBloc> _createTodoBloc() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    
    final localDataSource = TodoLocalDataSourceImpl(
      sharedPreferences: sharedPreferences,
    );
    
    final repository = TodoRepositoryImpl(
      localDataSource: localDataSource,
    );
    
    final getTodos = GetTodos(repository: repository);
    final saveTodo = SaveTodo(repository: repository);
    final deleteTodo = DeleteTodo(repository: repository);
    final updateTodo = UpdateTodo(repository: repository);
    
    return TodoBloc(
      getTodos: getTodos,
      saveTodo: saveTodo,
      deleteTodo: deleteTodo,
      updateTodo: updateTodo,
    );
  }
}
