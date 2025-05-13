import 'package:flutter/material.dart';
import 'package:flutter_mastery/features/5_real_world/posts_app/data/model/post_model.dart';

class PostWidget extends StatelessWidget {
  final PostModel post;
  const PostWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blue,
        child: Text(post.id.toString()),
      ),
      title: Text(post.title!),
      subtitle: Text(post.body!),
    );
  }
}
