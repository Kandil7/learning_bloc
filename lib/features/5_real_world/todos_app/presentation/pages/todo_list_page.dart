import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/todo_bloc.dart';
import '../bloc/todo_event.dart';
import '../bloc/todo_state.dart';
import '../widgets/add_todo_form.dart';
import '../widgets/todo_item.dart';

/// Page for displaying a list of todos
///
/// This page displays a list of todos and a form for adding new todos.
class TodoListPage extends StatelessWidget {
  /// Create a new todo list page
  const TodoListPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        centerTitle: true,
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodoInitial) {
            context.read<TodoBloc>().add(const LoadTodosEvent());
            return const Center(child: CircularProgressIndicator());
          } else if (state is TodosLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TodosLoaded) {
            return _buildTodoList(context, state);
          } else if (state is TodosError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text('Something went wrong'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTodoDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
  
  /// Build the todo list
  Widget _buildTodoList(BuildContext context, TodosLoaded state) {
    final todos = state.todos;
    
    if (todos.isEmpty) {
      return const Center(
        child: Text(
          'No todos yet. Add one!',
          style: TextStyle(fontSize: 18),
        ),
      );
    }
    
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return TodoItem(todo: todo);
      },
    );
  }
  
  /// Show a dialog to add a new todo
  void _showAddTodoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Todo'),
          content: const SingleChildScrollView(
            child: AddTodoForm(),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
