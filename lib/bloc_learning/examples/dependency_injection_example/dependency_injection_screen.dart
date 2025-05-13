import 'package:flutter/material.dart';
import 'package:flutter_mastery/bloc_learning/examples/dependency_injection_example/di/service_locator.dart';
import 'package:flutter_mastery/bloc_learning/examples/dependency_injection_example/screens/task_screen.dart';

/// DependencyInjectionScreen
///
/// This is the entry point for the Dependency Injection example.
/// It initializes the service locator and navigates to the TaskScreen.
class DependencyInjectionScreen extends StatefulWidget {
  const DependencyInjectionScreen({Key? key}) : super(key: key);

  @override
  State<DependencyInjectionScreen> createState() =>
      _DependencyInjectionScreenState();
}

class _DependencyInjectionScreenState extends State<DependencyInjectionScreen> {
  @override
  void initState() {
    super.initState();
    // Initialize the service locator
    setupServiceLocator();
  }

  @override
  Widget build(BuildContext context) {
    return const TaskScreen();
  }
}
