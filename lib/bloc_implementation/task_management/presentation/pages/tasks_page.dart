import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/task_bloc.dart';
import '../bloc/task_event.dart';
import '../bloc/task_state.dart';
import '../widgets/task_list.dart';
import '../widgets/task_form.dart';
import '../../../../core/di/injection_container.dart' as di;

/// Tasks Page
///
/// This page displays a list of tasks and allows the user to create, update, and delete tasks.
class TasksPage extends StatelessWidget {
  /// Route name for navigation
  static const routeName = '/tasks';

  /// Creates a new TasksPage instance
  const TasksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.sl<TaskBloc>()..add(const LoadTasksEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Task Management'),
        ),
        body: BlocConsumer<TaskBloc, TaskState>(
          listener: (context, state) {
            if (state is TaskOperationSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
              // Reload tasks after successful operation
              context.read<TaskBloc>().add(const LoadTasksEvent());
            } else if (state is TaskOperationFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is TaskLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is TasksLoaded) {
              return TaskList(tasks: state.tasks);
            } else if (state is TaskOperationFailure) {
              return Center(child: Text(state.message));
            } else {
              return const Center(child: Text('No tasks found'));
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (_) => BlocProvider.value(
                value: BlocProvider.of<TaskBloc>(context),
                child: const TaskForm(),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
