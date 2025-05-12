import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mastery/features/5_real_world/posts_app/presentation/bloc/post_event.dart';
import 'package:flutter_mastery/features/5_real_world/posts_app/presentation/widgets/error_widget.dart';
import 'package:flutter_mastery/features/5_real_world/posts_app/presentation/widgets/post_widget.dart';

import '../bloc/post_bloc.dart';
import '../bloc/post_state.dart';
import '../widgets/loading_widget.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(_onScroll);
    super.initState();
  }

  void _onScroll() {
    var curentPosition = scrollController.offset;
    var maxPosition = scrollController.position.maxScrollExtent;
    if (curentPosition >= (maxPosition * 0.8)) {
      context.read<PostBloc>().add(const FetchPostsEvent());
    }
  }

  @override
  void dispose() {
    scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post App'),
      ),
      body: BlocConsumer<PostBloc, PostState>(
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.status) {
            case PostStatus.loading:
              return const LoadingPosts();
            case PostStatus.success:
              if (state.posts.isEmpty) {
                return const Center(
                  child: Text('No Posts'),
                );
              }
              return ListView.builder(
                  controller: scrollController,
                  itemCount: state.hasReachedMax
                      ? state.posts.length
                      : state.posts.length + 1,
                  itemBuilder: (context, index) {
                    if (index < state.posts.length) {
                      return PostWidget(
                        post: state.posts[index],
                      );
                    } else {
                      return const LoadingPosts();
                    }
                  });
            case PostStatus.error:
              return ErrorPostLoading(errorMessege: state.errorMessege);
          }
        },
      ),
    );
  }
}
