# Real-World Flutter Applications

This section contains complete real-world applications that demonstrate the concepts learned in previous sections.

## Learning Objectives

- Apply theoretical concepts to real-world applications
- Understand how to structure complete Flutter applications
- Learn how to integrate with external APIs
- Implement complex state management

## Topics Covered

### 1. Posts App

- Fetching data from a REST API
- Displaying a list of posts
- Handling loading and error states
- Implementing pagination

### 2. Todos App

- Creating, reading, updating, and deleting todos
- Local storage with shared_preferences
- State management with BLoC
- Form validation

### 3. Connectivity App

- Monitoring network connectivity
- Handling offline mode
- Caching data for offline use
- Synchronizing data when back online

## Key Concepts

### API Integration

Integrating with external APIs is a common task in real-world applications:

```dart
// API client
class ApiClient {
  final Dio _dio;

  ApiClient(this._dio);

  Future<List<Post>> getPosts() async {
    try {
      final response = await _dio.get('https://jsonplaceholder.typicode.com/posts');
      return (response.data as List)
          .map((json) => Post.fromJson(json))
          .toList();
    } catch (e) {
      throw ServerException();
    }
  }

  Future<Post> getPost(int id) async {
    try {
      final response = await _dio.get('https://jsonplaceholder.typicode.com/posts/$id');
      return Post.fromJson(response.data);
    } catch (e) {
      throw ServerException();
    }
  }
}
```

### BLoC Implementation

Using BLoC for state management in real-world applications:

```dart
// Events
abstract class PostEvent {}
class FetchPostsEvent extends PostEvent {}
class RefreshPostsEvent extends PostEvent {}

// States
abstract class PostState {}
class PostInitial extends PostState {}
class PostLoading extends PostState {}
class PostLoaded extends PostState {
  final List<Post> posts;
  PostLoaded(this.posts);
}
class PostError extends PostState {
  final String message;
  PostError(this.message);
}

// BLoC
class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository repository;

  PostBloc({required this.repository}) : super(PostInitial()) {
    on<FetchPostsEvent>(_onFetchPosts);
    on<RefreshPostsEvent>(_onRefreshPosts);
  }

  Future<void> _onFetchPosts(FetchPostsEvent event, Emitter<PostState> emit) async {
    emit(PostLoading());
    try {
      final posts = await repository.getPosts();
      emit(PostLoaded(posts));
    } catch (e) {
      emit(PostError('Failed to fetch posts'));
    }
  }

  Future<void> _onRefreshPosts(RefreshPostsEvent event, Emitter<PostState> emit) async {
    try {
      final posts = await repository.getPosts();
      emit(PostLoaded(posts));
    } catch (e) {
      emit(PostError('Failed to refresh posts'));
    }
  }
}
```

### Offline Support

Handling offline mode in real-world applications:

```dart
// Network info
abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectivity;

  NetworkInfoImpl(this.connectivity);

  @override
  Future<bool> get isConnected async {
    final result = await connectivity.checkConnectivity();
    return result != ConnectivityResult.none;
  }
}

// Repository with offline support
class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remoteDataSource;
  final PostLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  PostRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<List<Post>> getPosts() async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await remoteDataSource.getPosts();
        localDataSource.cachePosts(remotePosts);
        return remotePosts;
      } on ServerException {
        final localPosts = await localDataSource.getLastPosts();
        return localPosts;
      }
    } else {
      try {
        final localPosts = await localDataSource.getLastPosts();
        return localPosts;
      } on CacheException {
        throw CacheFailure();
      }
    }
  }
}
```

## Resources

- [JSON Placeholder API](https://jsonplaceholder.typicode.com/)
- [Dio Package](https://pub.dev/packages/dio)
- [Connectivity Plus Package](https://pub.dev/packages/connectivity_plus)
- [Shared Preferences Package](https://pub.dev/packages/shared_preferences)
