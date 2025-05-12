# Posts App

This example demonstrates how to fetch and display posts from a REST API using the BLoC pattern and Clean Architecture.

## Learning Objectives

- Understand how to integrate with a REST API
- Learn how to implement Clean Architecture in a real-world application
- Master error handling and loading states
- Implement pagination

## Key Concepts

### API Integration

The Posts App integrates with the JSONPlaceholder API to fetch posts:

```dart
class PostRemoteDataSource {
  final Dio dio;

  PostRemoteDataSource({required this.dio});

  Future<List<PostModel>> getPosts() async {
    try {
      final response = await dio.get('https://jsonplaceholder.typicode.com/posts');
      return (response.data as List)
          .map((post) => PostModel.fromJson(post))
          .toList();
    } catch (e) {
      throw ServerException();
    }
  }
}
```

### Clean Architecture

The Posts App follows Clean Architecture principles:

1. **Domain Layer**: Contains the Post entity, PostRepository interface, and GetPosts use case
2. **Data Layer**: Contains the PostModel, PostRemoteDataSource, and PostRepositoryImpl
3. **Presentation Layer**: Contains the PostBloc, PostEvent, PostState, and UI components

### Error Handling

The Posts App handles errors using the Either type from the dartz package:

```dart
Future<Either<Failure, List<Post>>> getPosts() async {
  try {
    final posts = await remoteDataSource.getPosts();
    return Right(posts);
  } on ServerException {
    return Left(ServerFailure());
  }
}
```

### Loading States

The Posts App handles loading states using the BLoC pattern:

```dart
abstract class PostState extends Equatable {
  const PostState();
  
  @override
  List<Object> get props => [];
}

class PostInitial extends PostState {}
class PostLoading extends PostState {}
class PostLoaded extends PostState {
  final List<Post> posts;
  
  const PostLoaded(this.posts);
  
  @override
  List<Object> get props => [posts];
}
class PostError extends PostState {
  final String message;
  
  const PostError(this.message);
  
  @override
  List<Object> get props => [message];
}
```

## Implementation

The Posts App is implemented using Clean Architecture and the BLoC pattern. It fetches posts from the JSONPlaceholder API and displays them in a list.

## Resources

- [JSONPlaceholder API](https://jsonplaceholder.typicode.com/)
- [Dio Package](https://pub.dev/packages/dio)
- [flutter_bloc Package](https://pub.dev/packages/flutter_bloc)
- [dartz Package](https://pub.dev/packages/dartz)
