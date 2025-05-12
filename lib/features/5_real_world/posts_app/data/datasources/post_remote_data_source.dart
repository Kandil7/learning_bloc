import 'package:dio/dio.dart';
import '../../../../../core/error/exceptions.dart';
import '../models/post_model.dart';

/// Post remote data source
///
/// This class is responsible for fetching posts from the remote API.
abstract class PostRemoteDataSource {
  /// Get all posts
  ///
  /// Returns a list of post models.
  /// Throws a ServerException if there is a server error.
  Future<List<PostModel>> getPosts();
  
  /// Get a post by ID
  ///
  /// Returns a post model.
  /// Throws a ServerException if there is a server error.
  Future<PostModel> getPost(int id);
}

/// Implementation of the post remote data source
class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  /// The Dio HTTP client
  final Dio dio;
  
  /// Create a new post remote data source implementation
  PostRemoteDataSourceImpl({required this.dio});
  
  @override
  Future<List<PostModel>> getPosts() async {
    try {
      final response = await dio.get('https://jsonplaceholder.typicode.com/posts');
      
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((post) => PostModel.fromJson(post))
            .toList();
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
  
  @override
  Future<PostModel> getPost(int id) async {
    try {
      final response = await dio.get('https://jsonplaceholder.typicode.com/posts/$id');
      
      if (response.statusCode == 200) {
        return PostModel.fromJson(response.data);
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
