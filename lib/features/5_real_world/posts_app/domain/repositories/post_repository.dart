import 'package:dartz/dartz.dart';
import '../../../../../core/error/failures.dart';
import '../entities/post.dart';

/// Post repository interface
///
/// This interface defines the contract for the post repository.
/// It is implemented by the PostRepositoryImpl in the data layer.
abstract class PostRepository {
  /// Get all posts
  ///
  /// Returns a list of posts if successful, or a failure if not.
  Future<Either<Failure, List<Post>>> getPosts();
  
  /// Get a post by ID
  ///
  /// Returns a post if successful, or a failure if not.
  Future<Either<Failure, Post>> getPost(int id);
}
