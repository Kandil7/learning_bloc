import 'package:dio/dio.dart';
import 'package:learning_bloc/post_app/post_model/post_model.dart';

class PostsApi{
  static GetPosts (
  {
     int start= 0,
     int limit = 20
}
      ) async {
    final List<PostModel> posts = [];
    final dio = Dio();
    try{
      const String url = "https://jsonplaceholder.typicode.com/posts";
      var response = await dio.get('$url?_start=$start&_limit=$limit');

      posts.addAll(response.data.map<PostModel>((jsonPost) => PostModel.fromJson(jsonPost)).toList());
      return posts;
    }catch(e){

      print(e.toString());
      rethrow;
    }

  }
}