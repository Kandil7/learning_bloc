import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../domain/entities/task.dart';

/// Task Item Widget
///
/// This widget displays a single task item in the list.
class TaskItem extends StatelessWidget {
  /// Task to display
  final Task task;

  /// Callback when the task is toggled
  final VoidCallback onToggle;

  /// Callback when the task is deleted
  final VoidCallback onDelete;

  /// Creates a new TaskItem instance
  const TaskItem({
    Key? key,
    required this.task,
    required this.onToggle,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('MMM dd, yyyy');
    
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: Checkbox(
          value: task.isCompleted,
          onChanged: (_) => onToggle(),
        ),
        title: Text(
          task.title,
          style: TextStyle(
            decoration: task.isCompleted ? TextDecoration.lineThrough : null,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (task.description.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  task.description,
                  style: TextStyle(
                    decoration: task.isCompleted ? TextDecoration.lineThrough : null,
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                'Created: ${dateFormat.format(task.createdAt)}',
                style: const TextStyle(fontSize: 12),
              ),
            ),
            if (task.dueDate != null)
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Text(
                  'Due: ${dateFormat.format(task.dueDate!)}',
                  style: TextStyle(
                    fontSize: 12,
                    color: task.dueDate!.isBefore(DateTime.now()) && !task.isCompleted
                        ? Colors.red
                        : null,
                  ),
                ),
              ),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
