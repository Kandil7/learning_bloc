import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'di/task_injection_container.dart';
import 'presentation/pages/tasks_page.dart';

/// Task Management App
///
/// This is the main entry point for the task management feature.
class TaskManagementApp extends StatelessWidget {
  /// Service locator
  static final sl = GetIt.instance;

  /// Creates a new TaskManagementApp instance
  const TaskManagementApp({super.key});

  /// Initialize the task management feature
  static Future<void> init() async {
    await initTaskInjection(sl);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const TasksPage(),
    );
  }
}
