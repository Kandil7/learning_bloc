import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/complex_state/models/task.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/complex_state/task/task_bloc.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/complex_state/task/task_event.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/complex_state/task/task_state.dart';

/// Task Filters Widget
///
/// This widget displays filters for tasks.
class TaskFilters extends StatelessWidget {
  const TaskFilters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // View selector
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'View',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  _buildViewChip(
                    context,
                    'All Tasks',
                    state.currentView == TaskView.all,
                    () {
                      context.read<TaskBloc>().add(LoadTasks());
                    },
                  ),
                  _buildViewChip(
                    context,
                    'By Status',
                    state.currentView == TaskView.byStatus,
                    () {
                      // Show status filter dialog
                      _showStatusFilterDialog(context);
                    },
                  ),
                  _buildViewChip(
                    context,
                    'By Priority',
                    state.currentView == TaskView.byPriority,
                    () {
                      // Show priority filter dialog
                      _showPriorityFilterDialog(context);
                    },
                  ),
                  _buildViewChip(
                    context,
                    'Starred',
                    state.currentView == TaskView.starred,
                    () {
                      context.read<TaskBloc>().add(LoadStarredTasks());
                    },
                  ),
                ],
              ),
            ),
            
            // Active filters
            if (state.filterStatus != null ||
                state.filterPriority != null ||
                state.onlyStarred)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    if (state.filterStatus != null)
                      Chip(
                        label: Text('Status: ${_getStatusText(state.filterStatus!)}'),
                        deleteIcon: const Icon(Icons.close),
                        onDeleted: () {
                          context.read<TaskBloc>().add(LoadTasks());
                        },
                      ),
                    if (state.filterPriority != null)
                      Chip(
                        label: Text('Priority: ${_getPriorityText(state.filterPriority!)}'),
                        deleteIcon: const Icon(Icons.close),
                        onDeleted: () {
                          context.read<TaskBloc>().add(LoadTasks());
                        },
                      ),
                    if (state.onlyStarred)
                      Chip(
                        label: const Text('Starred Only'),
                        deleteIcon: const Icon(Icons.close),
                        onDeleted: () {
                          context.read<TaskBloc>().add(LoadTasks());
                        },
                      ),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }

  /// Build a view chip
  Widget _buildViewChip(
    BuildContext context,
    String label,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ChoiceChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (selected) {
          if (selected) {
            onTap();
          }
        },
      ),
    );
  }

  /// Show status filter dialog
  void _showStatusFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Filter by Status'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('To Do'),
                onTap: () {
                  context.read<TaskBloc>().add(LoadTasksByStatus(TaskStatus.todo));
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('In Progress'),
                onTap: () {
                  context.read<TaskBloc>().add(LoadTasksByStatus(TaskStatus.inProgress));
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Done'),
                onTap: () {
                  context.read<TaskBloc>().add(LoadTasksByStatus(TaskStatus.done));
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  /// Show priority filter dialog
  void _showPriorityFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Filter by Priority'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Low'),
                onTap: () {
                  context.read<TaskBloc>().add(LoadTasksByPriority(TaskPriority.low));
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Medium'),
                onTap: () {
                  context.read<TaskBloc>().add(LoadTasksByPriority(TaskPriority.medium));
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('High'),
                onTap: () {
                  context.read<TaskBloc>().add(LoadTasksByPriority(TaskPriority.high));
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  /// Get the text for a status
  String _getStatusText(TaskStatus status) {
    switch (status) {
      case TaskStatus.todo:
        return 'To Do';
      case TaskStatus.inProgress:
        return 'In Progress';
      case TaskStatus.done:
        return 'Done';
    }
  }

  /// Get the text for a priority level
  String _getPriorityText(TaskPriority priority) {
    switch (priority) {
      case TaskPriority.low:
        return 'Low';
      case TaskPriority.medium:
        return 'Medium';
      case TaskPriority.high:
        return 'High';
    }
  }
}
