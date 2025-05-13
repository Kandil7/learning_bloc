import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/complex_state/models/task.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/complex_state/task/task_bloc.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/complex_state/task/task_event.dart';
import 'package:intl/intl.dart';

/// Add Task Dialog
///
/// This dialog allows the user to add a new task.
class AddTaskDialog extends StatefulWidget {
  const AddTaskDialog({Key? key}) : super(key: key);

  @override
  State<AddTaskDialog> createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _tagsController = TextEditingController();
  
  DateTime _dueDate = DateTime.now().add(const Duration(days: 1));
  TaskPriority _priority = TaskPriority.medium;
  TaskStatus _status = TaskStatus.todo;
  bool _isStarred = false;

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _tagsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Task'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              
              // Description
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              
              // Due date
              Row(
                children: [
                  const Text('Due Date:'),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      DateFormat('MMM d, yyyy').format(_dueDate),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () async {
                      final date = await showDatePicker(
                        context: context,
                        initialDate: _dueDate,
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(const Duration(days: 365)),
                      );
                      if (date != null) {
                        setState(() {
                          _dueDate = date;
                        });
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              
              // Priority
              Row(
                children: [
                  const Text('Priority:'),
                  const SizedBox(width: 8),
                  Expanded(
                    child: DropdownButtonFormField<TaskPriority>(
                      value: _priority,
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            _priority = value;
                          });
                        }
                      },
                      items: TaskPriority.values
                          .map((priority) => DropdownMenuItem(
                                value: priority,
                                child: Text(_getPriorityText(priority)),
                              ))
                          .toList(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              
              // Status
              Row(
                children: [
                  const Text('Status:'),
                  const SizedBox(width: 8),
                  Expanded(
                    child: DropdownButtonFormField<TaskStatus>(
                      value: _status,
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            _status = value;
                          });
                        }
                      },
                      items: TaskStatus.values
                          .map((status) => DropdownMenuItem(
                                value: status,
                                child: Text(_getStatusText(status)),
                              ))
                          .toList(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              
              // Tags
              TextFormField(
                controller: _tagsController,
                decoration: const InputDecoration(
                  labelText: 'Tags (comma separated)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              
              // Starred
              Row(
                children: [
                  Checkbox(
                    value: _isStarred,
                    onChanged: (value) {
                      setState(() {
                        _isStarred = value ?? false;
                      });
                    },
                  ),
                  const Text('Star this task'),
                ],
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              // Create a new task
              final task = Task(
                id: '',
                title: _titleController.text,
                description: _descriptionController.text,
                dueDate: _dueDate,
                priority: _priority,
                status: _status,
                tags: _tagsController.text.isEmpty
                    ? []
                    : _tagsController.text.split(',').map((e) => e.trim()).toList(),
                isStarred: _isStarred,
              );
              
              // Add the task
              context.read<TaskBloc>().add(AddTask(task));
              
              // Close the dialog
              Navigator.pop(context);
            }
          },
          child: const Text('Add'),
        ),
      ],
    );
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
}
