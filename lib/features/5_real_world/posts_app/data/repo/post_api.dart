import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_mastery/features/5_real_world/posts_app/data/model/post_model.dart';

abstract class PostApi {
  Future<List<PostModel>> getPosts({int start, int limit});
}

class PostsApi implements PostApi {
  @override
  Future<List<PostModel>> getPosts({int start = 10, int limit = 20}) async {
    final List<PostModel> posts = [];
    final dio = Dio();
    try {
      const String url = "https://jsonplaceholder.typicode.com/posts";
      var response =
          await dio.get('$url?_start=${start ?? 10}&_limit=${limit ?? 10}');

      posts.addAll(response.data
          .map<PostModel>((jsonPost) => PostModel.fromJson(jsonPost))
          .toList());
      return posts;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      rethrow;
    }
  }
}
