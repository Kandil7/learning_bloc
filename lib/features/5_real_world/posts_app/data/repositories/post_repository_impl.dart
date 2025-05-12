import 'package:dartz/dartz.dart';
import '../../../../../core/error/exceptions.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/network/network_info.dart';
import '../../domain/entities/post.dart';
import '../../domain/repositories/post_repository.dart';
import '../datasources/post_remote_data_source.dart';

/// Implementation of the post repository
///
/// This class implements the PostRepository interface from the domain layer.
/// It uses the PostRemoteDataSource to fetch posts from the remote API.
class PostRepositoryImpl implements PostRepository {
  /// The post remote data source
  final PostRemoteDataSource remoteDataSource;
  
  /// The network information
  final NetworkInfo networkInfo;
  
  /// Create a new post repository implementation
  PostRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });
  
  @override
  Future<Either<Failure, List<Post>>> getPosts() async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await remoteDataSource.getPosts();
        return Right(remotePosts);
      } on ServerException {
        return const Left(ServerFailure());
      }
    } else {
      return const Left(NetworkFailure());
    }
  }
  
  @override
  Future<Either<Failure, Post>> getPost(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePost = await remoteDataSource.getPost(id);
        return Right(remotePost);
      } on ServerException {
        return const Left(ServerFailure());
      }
    } else {
      return const Left(NetworkFailure());
    }
  }
}
