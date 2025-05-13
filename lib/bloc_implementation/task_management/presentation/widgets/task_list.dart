import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/task.dart';
import '../bloc/task_bloc.dart';
import '../bloc/task_event.dart';
import 'task_item.dart';

/// Task List Widget
///
/// This widget displays a list of tasks.
class TaskList extends StatelessWidget {
  /// List of tasks to display
  final List<Task> tasks;

  /// Creates a new TaskList instance
  const TaskList({Key? key, required this.tasks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (tasks.isEmpty) {
      return const Center(
        child: Text(
          'No tasks yet. Add a new task!',
          style: TextStyle(fontSize: 18),
        ),
      );
    }

    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return TaskItem(
          task: task,
          onToggle: () {
            context.read<TaskBloc>().add(ToggleTaskEvent(task));
          },
          onDelete: () {
            context.read<TaskBloc>().add(DeleteTaskEvent(task.id));
          },
        );
      },
    );
  }
}
