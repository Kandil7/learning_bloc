import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/error/failures.dart';
import '../entities/post.dart';
import '../repositories/post_repository.dart';

/// Get post use case
///
/// This use case is responsible for getting a post by ID.
/// It uses the PostRepository to get the post.
class GetPost {
  /// The post repository
  final PostRepository repository;
  
  /// Create a new get post use case
  const GetPost({required this.repository});
  
  /// Execute the use case
  ///
  /// Returns a post if successful, or a failure if not.
  Future<Either<Failure, Post>> call(Params params) async {
    return await repository.getPost(params.id);
  }
}

/// Parameters for the GetPost use case
///
/// This class contains the parameters for the GetPost use case.
class Params extends Equatable {
  /// The ID of the post to get
  final int id;
  
  /// Create new parameters
  const Params({required this.id});
  
  @override
  List<Object> get props => [id];
}
