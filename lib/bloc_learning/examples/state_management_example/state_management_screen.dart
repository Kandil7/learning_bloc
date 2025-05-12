import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Events
enum TaskEvent { add, delete, markComplete, markIncomplete, error }

// States
abstract class TaskState {}

class TaskInitial extends TaskState {}

class TaskLoading extends TaskState {}

class TaskLoaded extends TaskState {
  final List<Task> tasks;
  TaskLoaded(this.tasks);
}

class TaskError extends TaskState {
  final String message;
  TaskError(this.message);
}

// Model
class Task {
  final String id;
  final String title;
  final bool isCompleted;

  Task({required this.id, required this.title, this.isCompleted = false});

  Task copyWith({String? id, String? title, bool? isCompleted}) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}

// BLoC
class TaskBloc extends Bloc<TaskEvent, TaskState> {
  List<Task> _tasks = [];

  TaskBloc() : super(TaskInitial()) {
    on<TaskEvent>((event, emit) async {
      switch (event) {
        case TaskEvent.add:
          emit(TaskLoading());
          await Future.delayed(const Duration(milliseconds: 500)); // Simulate loading
          _tasks.add(
            Task(id: DateTime.now().toString(), title: 'New Task ${_tasks.length + 1}'),
          );
          emit(TaskLoaded(_tasks));
          break;

        case TaskEvent.delete:
          emit(TaskLoading());
          await Future.delayed(const Duration(milliseconds: 500)); // Simulate loading
          if (_tasks.isNotEmpty) {
            _tasks.removeLast();
          }
          emit(TaskLoaded(_tasks));
          break;

        case TaskEvent.markComplete:
          emit(TaskLoading());
          await Future.delayed(const Duration(milliseconds: 500)); // Simulate loading
          if (_tasks.isNotEmpty) {
            final lastTask = _tasks.last;
            _tasks[_tasks.length - 1] = lastTask.copyWith(isCompleted: true);
          }
          emit(TaskLoaded(_tasks));
          break;

        case TaskEvent.markIncomplete:
          emit(TaskLoading());
          await Future.delayed(const Duration(milliseconds: 500)); // Simulate loading
          if (_tasks.isNotEmpty) {
            final lastTask = _tasks.last;
            _tasks[_tasks.length - 1] = lastTask.copyWith(isCompleted: false);
          }
          emit(TaskLoaded(_tasks));
          break;

        case TaskEvent.error:
          emit(TaskError('An error occurred while processing tasks'));
          break;
      }
    });
  }
}

class StateManagementScreen extends StatelessWidget {
  const StateManagementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('State Management Example'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildExplanation(),
              const SizedBox(height: 24),
              _buildStateVisualization(),
              const SizedBox(height: 24),
              _buildTaskList(),
            ],
          ),
        ),
        bottomNavigationBar: _buildActionButtons(),
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
            'State Management with BLoC',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 8),
          Text(
            'This example demonstrates different states in BLoC pattern:',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 4),
          Text('• Initial State: Starting state when BLoC is created', style: TextStyle(fontSize: 14)),
          Text('• Loading State: Shown during async operations', style: TextStyle(fontSize: 14)),
          Text('• Loaded State: Displays data after successful operations', style: TextStyle(fontSize: 14)),
          Text('• Error State: Shown when operations fail', style: TextStyle(fontSize: 14)),
          Text('• Use the buttons below to trigger different states', style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildStateVisualization() {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: _getStateColor(state),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(_getStateIcon(state), size: 36),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Current State: ${_getStateName(state)}',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 4),
                    Text(_getStateDescription(state)),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTaskList() {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        if (state is TaskLoaded) {
          if (state.tasks.isEmpty) {
            return const Center(
              child: Text('No tasks yet. Add some tasks using the buttons below.'),
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
              ...state.tasks.map((task) => Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: ListTile(
                      leading: Icon(
                        task.isCompleted ? Icons.check_circle : Icons.circle_outlined,
                        color: task.isCompleted ? Colors.green : Colors.grey,
                      ),
                      title: Text(
                        task.title,
                        style: TextStyle(
                          decoration: task.isCompleted ? TextDecoration.lineThrough : null,
                        ),
                      ),
                    ),
                  )),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildActionButtons() {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildActionButton(
                icon: Icons.add,
                label: 'Add',
                color: Colors.green,
                onPressed: () => context.read<TaskBloc>().add(TaskEvent.add),
              ),
              _buildActionButton(
                icon: Icons.delete,
                label: 'Delete',
                color: Colors.red,
                onPressed: () => context.read<TaskBloc>().add(TaskEvent.delete),
              ),
              _buildActionButton(
                icon: Icons.check,
                label: 'Complete',
                color: Colors.blue,
                onPressed: () => context.read<TaskBloc>().add(TaskEvent.markComplete),
              ),
              _buildActionButton(
                icon: Icons.error,
                label: 'Error',
                color: Colors.orange,
                onPressed: () => context.read<TaskBloc>().add(TaskEvent.error),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          heroTag: label,
          onPressed: onPressed,
          backgroundColor: color,
          mini: true,
          child: Icon(icon),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Color _getStateColor(TaskState state) {
    if (state is TaskInitial) return Colors.grey[200]!;
    if (state is TaskLoading) return Colors.blue[100]!;
    if (state is TaskLoaded) return Colors.green[100]!;
    if (state is TaskError) return Colors.red[100]!;
    return Colors.grey[200]!;
  }

  IconData _getStateIcon(TaskState state) {
    if (state is TaskInitial) return Icons.hourglass_empty;
    if (state is TaskLoading) return Icons.refresh;
    if (state is TaskLoaded) return Icons.check_circle;
    if (state is TaskError) return Icons.error;
    return Icons.help;
  }

  String _getStateName(TaskState state) {
    if (state is TaskInitial) return 'Initial';
    if (state is TaskLoading) return 'Loading';
    if (state is TaskLoaded) return 'Loaded';
    if (state is TaskError) return 'Error';
    return 'Unknown';
  }

  String _getStateDescription(TaskState state) {
    if (state is TaskInitial) return 'BLoC is initialized but no events processed yet';
    if (state is TaskLoading) return 'Processing your request...';
    if (state is TaskLoaded) return 'Successfully loaded ${state.tasks.length} tasks';
    if (state is TaskError) return state.message;
    return 'Unknown state';
  }
}