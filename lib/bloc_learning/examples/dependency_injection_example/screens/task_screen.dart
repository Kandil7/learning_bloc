import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mastery/bloc_learning/examples/dependency_injection_example/blocs/task_bloc.dart';
import 'package:flutter_mastery/bloc_learning/examples/dependency_injection_example/di/service_locator.dart';
import 'package:flutter_mastery/bloc_learning/examples/dependency_injection_example/repositories/task_repository.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final _taskController = TextEditingController();

  @override
  void dispose() {
    _taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Create a TaskBloc using the service locator
    // This demonstrates how to get a dependency from the service locator
    return BlocProvider(
      create: (context) => getIt<TaskBloc>()..add(LoadTasksEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Task Manager'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildExplanation(),
              const SizedBox(height: 24),
              _buildTaskInput(),
              const SizedBox(height: 24),
              _buildTaskList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExplanation() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.purple[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.purple[200]!),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Dependency Injection with get_it',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 8),
          Text(
            'This example demonstrates dependency injection using get_it:',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 4),
          Text('• Dependencies are registered in a central service locator',
              style: TextStyle(fontSize: 14)),
          Text('• Components request dependencies instead of creating them',
              style: TextStyle(fontSize: 14)),
          Text(
              '• TaskBloc depends on TaskService which depends on TaskRepository',
              style: TextStyle(fontSize: 14)),
          Text(
              '• Each layer is decoupled from the implementation details of its dependencies',
              style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildTaskInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _taskController,
          decoration: const InputDecoration(
            labelText: 'New Task',
            hintText: 'Enter task description',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),
        BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            return ElevatedButton(
              onPressed: state is TaskLoading
                  ? null
                  : () {
                      final title = _taskController.text.trim();
                      if (title.isNotEmpty) {
                        context.read<TaskBloc>().add(AddTaskEvent(title));
                        _taskController.clear();
                      }
                    },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text('ADD TASK', style: TextStyle(fontSize: 16)),
            );
          },
        ),
      ],
    );
  }

  Widget _buildTaskList() {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        if (state is TaskLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TaskLoaded) {
          if (state.tasks.isEmpty) {
            return const Center(
              child: Text('No tasks yet. Add some tasks using the form above.'),
            );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Tasks:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              ...state.tasks.map((task) => _buildTaskItem(context, task)),
            ],
          );
        } else if (state is TaskError) {
          return Center(
            child: Column(
              children: [
                const Icon(Icons.error, color: Colors.red, size: 48),
                const SizedBox(height: 16),
                Text(
                  'Error: ${state.message}',
                  style: const TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildTaskItem(BuildContext context, Task task) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: IconButton(
          icon: Icon(
            task.isCompleted ? Icons.check_circle : Icons.circle_outlined,
            color: task.isCompleted ? Colors.green : Colors.grey,
          ),
          onPressed: () {
            context.read<TaskBloc>().add(ToggleTaskEvent(task.id));
          },
        ),
        title: Text(
          task.title,
          style: TextStyle(
            decoration: task.isCompleted ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () {
            context.read<TaskBloc>().add(DeleteTaskEvent(task.id));
          },
        ),
      ),
    );
  }
}
