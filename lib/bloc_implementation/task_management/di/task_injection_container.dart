import 'package:get_it/get_it.dart';
import '../data/datasources/task_local_data_source.dart';
import '../data/repositories/task_repository_impl.dart';
import '../domain/repositories/task_repository.dart';
import '../domain/usecases/create_task.dart';
import '../domain/usecases/delete_task.dart';
import '../domain/usecases/get_task_by_id.dart';
import '../domain/usecases/get_tasks.dart';
import '../domain/usecases/update_task.dart';
import '../presentation/bloc/task_bloc.dart';

/// Initialize the dependency injection container for the task management feature
Future<void> initTaskInjection(GetIt sl) async {
  // BLoC
  sl.registerFactory(
    () => TaskBloc(
      getTasks: sl(),
      getTaskById: sl(),
      createTask: sl(),
      updateTask: sl(),
      deleteTask: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetTasks(sl()));
  sl.registerLazySingleton(() => GetTaskById(sl()));
  sl.registerLazySingleton(() => CreateTask(sl()));
  sl.registerLazySingleton(() => UpdateTask(sl()));
  sl.registerLazySingleton(() => DeleteTask(sl()));

  // Repository
  sl.registerLazySingleton<TaskRepository>(
    () => TaskRepositoryImpl(localDataSource: sl(), networkInfo: sl()),
  );

  // Data sources
  sl.registerLazySingleton<TaskLocalDataSource>(
    () => TaskLocalDataSourceImpl(sharedPreferences: sl()),
  );

  // External
  // Note: These should be registered in the main injection container if not already
  // sl.registerLazySingleton(() => await SharedPreferences.getInstance());
  // sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(connectivity: sl()));
}
