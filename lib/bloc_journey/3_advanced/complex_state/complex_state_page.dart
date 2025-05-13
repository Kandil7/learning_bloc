import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/complex_state/data/task_repository.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/complex_state/task/task_bloc.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/complex_state/task/task_event.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/complex_state/task/task_state.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/complex_state/widgets/add_task_dialog.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/complex_state/widgets/task_filters.dart';
import 'package:flutter_mastery/bloc_journey/3_advanced/complex_state/widgets/task_list.dart';

/// Complex State Page
///
/// This page demonstrates complex state management with BLoC.
class ComplexStatePage extends StatelessWidget {
  const ComplexStatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc(
        taskRepository: TaskRepository(),
      )..add(LoadTasks()), // Load tasks when the page is created
      child: const ComplexStateView(),
    );
  }
}

/// Complex State View
///
/// This widget contains the UI for the complex state management example.
class ComplexStateView extends StatelessWidget {
  const ComplexStateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complex State Management'),
      ),
      body: Column(
        children: [
          // Explanation text
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'This example demonstrates complex state management with BLoC. '
              'The app manages a task list with filtering, sorting, and CRUD operations. '
              'The state includes multiple properties and the UI updates based on changes to any of them.',
              style: TextStyle(fontSize: 16),
            ),
          ),
          
          // Task filters
          const TaskFilters(),
          
          // Task list
          Expanded(
            child: BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                
                if (state.error != null) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.error_outline,
                          color: Colors.red,
                          size: 60,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Error',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          state.error!,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            context.read<TaskBloc>().add(LoadTasks());
                          },
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  );
                }
                
                return TaskList(tasks: state.filteredTasks);
              },
            ),
          ),
          
          // Code explanation
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.grey[200],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Key Concepts:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 8),
                Text('• Complex state: State with multiple properties'),
                Text('• Computed properties: Derived from state (filteredTasks)'),
                Text('• State transitions: Loading, error, and success states'),
                Text('• Filtering and sorting: Applied to the state'),
                SizedBox(height: 16),
                Text(
                  'Implementation Details:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 8),
                Text('1. TaskState contains multiple properties'),
                Text('2. TaskBloc handles various events and updates state'),
                Text('3. UI rebuilds based on state changes'),
                Text('4. Filtering is applied to the state'),
              ],
            ),
          ),
        ],
      ),
      // Add task button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => const AddTaskDialog(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
