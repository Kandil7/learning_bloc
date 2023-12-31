import 'package:flutter/material.dart';
import 'package:learning_bloc/post_app/post_model/post_model.dart';

class PostWidget extends StatelessWidget {
  final PostModel post;
  const PostWidget({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(post.id.toString()),
        backgroundColor: Colors.blue,
      ),
      title: Text(post.title!),
      subtitle: Text(post.body!),
    );
  }
}
