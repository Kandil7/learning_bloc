import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/5_real_world/posts_app/data/datasources/post_remote_data_source.dart';
import '../../features/5_real_world/posts_app/data/repositories/post_repository_impl.dart';
import '../../features/5_real_world/posts_app/domain/repositories/post_repository.dart';
import '../../features/5_real_world/posts_app/domain/usecases/get_post.dart';
import '../../features/5_real_world/posts_app/domain/usecases/get_posts.dart';
import '../../features/5_real_world/posts_app/presentation/bloc/post_bloc.dart';
import '../../features/5_real_world/todos_app/data/datasources/todo_local_data_source.dart';
import '../../features/5_real_world/todos_app/data/repositories/todo_repository_impl.dart';
import '../../features/5_real_world/todos_app/domain/repositories/todo_repository.dart';
import '../../features/5_real_world/todos_app/domain/usecases/delete_todo.dart';
import '../../features/5_real_world/todos_app/domain/usecases/get_todos.dart';
import '../../features/5_real_world/todos_app/domain/usecases/save_todo.dart';
import '../../features/5_real_world/todos_app/domain/usecases/update_todo.dart';
import '../../features/5_real_world/todos_app/presentation/bloc/todo_bloc.dart';
import '../network/network_info.dart';

/// Service locator
final sl = GetIt.instance;

/// Initialize the service locator
Future<void> init() async {
  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => Connectivity());
  
  // Core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(connectivity: sl()),
  );
  
  // Posts feature
  _initPostsFeature();
  
  // Todos feature
  _initTodosFeature();
}

/// Initialize the posts feature
void _initPostsFeature() {
  // BLoC
  sl.registerFactory(
    () => PostBloc(),
  );
  
  // Use cases
  sl.registerLazySingleton(() => GetPosts(repository: sl()));
  sl.registerLazySingleton(() => GetPost(repository: sl()));
  
  // Repository
  sl.registerLazySingleton<PostRepository>(
    () => PostRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  
  // Data sources
  sl.registerLazySingleton<PostRemoteDataSource>(
    () => PostRemoteDataSourceImpl(dio: sl()),
  );
}

/// Initialize the todos feature
void _initTodosFeature() {
  // BLoC
  sl.registerFactory(
    () => TodoBloc(
      getTodos: sl(),
      saveTodo: sl(),
      deleteTodo: sl(),
      updateTodo: sl(),
    ),
  );
  
  // Use cases
  sl.registerLazySingleton(() => GetTodos(repository: sl()));
  sl.registerLazySingleton(() => SaveTodo(repository: sl()));
  sl.registerLazySingleton(() => DeleteTodo(repository: sl()));
  sl.registerLazySingleton(() => UpdateTodo(repository: sl()));
  
  // Repository
  sl.registerLazySingleton<TodoRepository>(
    () => TodoRepositoryImpl(
      localDataSource: sl(),
    ),
  );
  
  // Data sources
  sl.registerLazySingleton<TodoLocalDataSource>(
    () => TodoLocalDataSourceImpl(
      sharedPreferences: sl(),
    ),
  );
}
