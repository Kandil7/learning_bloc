# BLoC Implementation

This directory contains a step-by-step implementation of the BLoC pattern in Flutter, following Clean Architecture principles.

## Project Structure

The project is organized following Clean Architecture principles:

```
lib/bloc_implementation/
├── task_management/
│   ├── data/
│   │   ├── datasources/
│   │   ├── models/
│   │   └── repositories/
│   ├── domain/
│   │   ├── entities/
│   │   ├── repositories/
│   │   └── usecases/
│   ├── presentation/
│   │   ├── bloc/
│   │   ├── pages/
│   │   └── widgets/
│   ├── di/
│   └── task_management_app.dart
└── README.md
```

## Clean Architecture Layers

### Domain Layer

The domain layer contains the business logic of the application. It is independent of any other layers.

- **Entities**: Business objects (e.g., Task)
- **Repositories**: Interfaces defining the contract for data operations
- **Use Cases**: Business logic operations (e.g., GetTasks, CreateTask)

### Data Layer

The data layer implements the repositories defined in the domain layer.

- **Models**: Data models that extend entities with additional functionality
- **Repositories**: Implementations of the repository interfaces
- **Data Sources**: Sources of data (e.g., local storage, API)

### Presentation Layer

The presentation layer contains the UI and BLoC components.

- **BLoC**: Business Logic Components that manage state
- **Pages**: UI screens
- **Widgets**: Reusable UI components

## BLoC Pattern Implementation

### Events

Events are the inputs to the BLoC. They are dispatched by the UI and processed by the BLoC.

```dart
abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object?> get props => [];
}

class LoadTasksEvent extends TaskEvent {
  const LoadTasksEvent();
}
```

### States

States are the outputs of the BLoC. They represent the state of the UI.

```dart
abstract class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object?> get props => [];
}

class TasksLoaded extends TaskState {
  final List<Task> tasks;

  const TasksLoaded(this.tasks);

  @override
  List<Object?> get props => [tasks];
}
```

### BLoC

The BLoC processes events and emits states.

```dart
class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final GetTasks getTasks;

  TaskBloc({required this.getTasks}) : super(const TaskInitial()) {
    on<LoadTasksEvent>(_onLoadTasks);
  }

  Future<void> _onLoadTasks(
    LoadTasksEvent event,
    Emitter<TaskState> emit,
  ) async {
    emit(const TaskLoading());
    final result = await getTasks(NoParams());
    result.fold(
      (failure) => emit(TaskOperationFailure(failure.message)),
      (tasks) => emit(TasksLoaded(tasks)),
    );
  }
}
```

## Dependency Injection

Dependency injection is implemented using the `get_it` package.

```dart
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
  
  // Repository
  sl.registerLazySingleton<TaskRepository>(
    () => TaskRepositoryImpl(
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<TaskLocalDataSource>(
    () => TaskLocalDataSourceImpl(
      sharedPreferences: sl(),
    ),
  );
}
```

## UI Integration

The UI is integrated with the BLoC using the `flutter_bloc` package.

```dart
BlocProvider(
  create: (_) => sl<TaskBloc>()..add(const LoadTasksEvent()),
  child: Scaffold(
    body: BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        if (state is TaskLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is TasksLoaded) {
          return TaskList(tasks: state.tasks);
        } else {
          return const Center(child: Text('No tasks found'));
        }
      },
    ),
  ),
)
```

## Error Handling

Errors are handled using the Either type from the `dartz` package.

```dart
Future<Either<Failure, List<Task>>> getTasks() async {
  try {
    final tasks = await localDataSource.getTasks();
    return Right(tasks);
  } on CacheException catch (e) {
    return Left(CacheFailure(message: e.message));
  }
}
```

## Testing

BLoCs can be tested using the `bloc_test` package.

```dart
blocTest<TaskBloc, TaskState>(
  'emits [TaskLoading, TasksLoaded] when LoadTasksEvent is added',
  build: () {
    when(mockGetTasks(any)).thenAnswer((_) async => Right([task]));
    return TaskBloc(getTasks: mockGetTasks);
  },
  act: (bloc) => bloc.add(const LoadTasksEvent()),
  expect: () => [
    const TaskLoading(),
    TasksLoaded([task]),
  ],
);
```
