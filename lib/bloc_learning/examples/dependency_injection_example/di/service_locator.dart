import 'package:get_it/get_it.dart';
import 'package:flutter_mastery/bloc_learning/examples/dependency_injection_example/blocs/task_bloc.dart';
import 'package:flutter_mastery/bloc_learning/examples/dependency_injection_example/repositories/task_repository.dart';
import 'package:flutter_mastery/bloc_learning/examples/dependency_injection_example/services/task_service.dart';

/// Global ServiceLocator instance
final GetIt getIt = GetIt.instance;

/// Initialize the Service Locator
///
/// This method sets up all dependencies for the application.
/// It should be called at the start of the application.
void setupServiceLocator() {
  // Register repositories
  // Using registerLazySingleton to create the instance only when first needed
  getIt.registerLazySingleton<TaskRepository>(
    () => TaskRepositoryImpl(),
  );

  // Register services
  // TaskService depends on TaskRepository, which is injected from the service locator
  getIt.registerLazySingleton<TaskService>(
    () => TaskServiceImpl(getIt<TaskRepository>()),
  );

  // Register BLoCs
  // Using registerFactory to create a new instance each time it's requested
  // This is important for BLoCs that might need to be created and disposed multiple times
  getIt.registerFactory<TaskBloc>(
    () => TaskBloc(getIt<TaskService>()),
  );
}
