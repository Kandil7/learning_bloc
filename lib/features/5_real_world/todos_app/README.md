# Todos App

This example demonstrates how to create a todo list application using the BLoC pattern and Clean Architecture.

## Learning Objectives

- Understand how to implement CRUD operations
- Learn how to use local storage with shared_preferences
- Master state management with BLoC
- Implement form validation

## Key Concepts

### CRUD Operations

The Todos App implements Create, Read, Update, and Delete operations:

```dart
class TodoLocalDataSource {
  final SharedPreferences sharedPreferences;

  TodoLocalDataSource({required this.sharedPreferences});

  Future<List<TodoModel>> getTodos() async {
    final jsonString = sharedPreferences.getString('todos');
    if (jsonString != null) {
      final List<dynamic> jsonList = json.decode(jsonString);
      return jsonList.map((json) => TodoModel.fromJson(json)).toList();
    }
    return [];
  }

  Future<void> saveTodos(List<TodoModel> todos) async {
    final jsonList = todos.map((todo) => todo.toJson()).toList();
    await sharedPreferences.setString('todos', json.encode(jsonList));
  }
}
```

### Local Storage

The Todos App uses shared_preferences for local storage:

```dart
class TodoRepositoryImpl implements TodoRepository {
  final TodoLocalDataSource localDataSource;

  TodoRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, List<Todo>>> getTodos() async {
    try {
      final todos = await localDataSource.getTodos();
      return Right(todos);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> saveTodo(Todo todo) async {
    try {
      final todos = await localDataSource.getTodos();
      final todoModel = TodoModel.fromEntity(todo);
      todos.add(todoModel);
      await localDataSource.saveTodos(todos);
      return const Right(null);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
```

### State Management with BLoC

The Todos App uses the BLoC pattern for state management:

```dart
class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final GetTodos getTodos;
  final SaveTodo saveTodo;
  final DeleteTodo deleteTodo;
  final UpdateTodo updateTodo;

  TodoBloc({
    required this.getTodos,
    required this.saveTodo,
    required this.deleteTodo,
    required this.updateTodo,
  }) : super(TodoInitial()) {
    on<LoadTodosEvent>(_onLoadTodos);
    on<AddTodoEvent>(_onAddTodo);
    on<DeleteTodoEvent>(_onDeleteTodo);
    on<UpdateTodoEvent>(_onUpdateTodo);
  }

  // Event handlers...
}
```

## Implementation

The Todos App is implemented using Clean Architecture and the BLoC pattern. It allows users to create, read, update, and delete todos.

## Resources

- [shared_preferences Package](https://pub.dev/packages/shared_preferences)
- [flutter_bloc Package](https://pub.dev/packages/flutter_bloc)
- [dartz Package](https://pub.dev/packages/dartz)
- [equatable Package](https://pub.dev/packages/equatable)
