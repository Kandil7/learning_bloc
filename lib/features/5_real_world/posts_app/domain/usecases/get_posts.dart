import 'package:dartz/dartz.dart';
import '../../../../../core/error/failures.dart';
import '../entities/post.dart';
import '../repositories/post_repository.dart';

/// Get posts use case
///
/// This use case is responsible for getting all posts.
/// It uses the PostRepository to get the posts.
class GetPosts {
  /// The post repository
  final PostRepository repository;
  
  /// Create a new get posts use case
  const GetPosts({required this.repository});
  
  /// Execute the use case
  ///
  /// Returns a list of posts if successful, or a failure if not.
  Future<Either<Failure, List<Post>>> call() async {
    return await repository.getPosts();
  }
}
