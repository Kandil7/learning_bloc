

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:learning_bloc/post_app/post_bloc/post_event.dart';
import 'package:learning_bloc/post_app/post_bloc/post_state.dart';

import '../services/post_api.dart';


class PostBloc extends Bloc<PostEvent, PostState> {

  PostBloc() : super(PostState()) {
    on<PostEvent>((event, emit) async {
      if(event is GetAllPostsEvent) {
        if(state.hasReachedMax) return;


        try {
          if(state.status == PostStatus.loading) {
            final posts = await PostsApi.GetPosts();
            return posts.isEmpty
              ?emit(state.copyWith(status:PostStatus.success,hasReachedMax: true))
            : emit(state.copyWith(status: PostStatus.success, posts: posts, hasReachedMax: false));
          }
          else {
            final posts = await PostsApi.GetPosts(start: state.posts.length);
            posts.isEmpty
                ? emit(state.copyWith(hasReachedMax: true))
               :emit(state.copyWith(
        status: PostStatus.success,
                posts: List.of(state.posts)..addAll(posts),
                hasReachedMax: false
            ));
          }
        } catch(e) {
          emit(state.copyWith(status: PostStatus.error,
              errorMessege: 'Something went wrong'));
        }
      }
    },
    transformer: droppable()
    );

  }
}
