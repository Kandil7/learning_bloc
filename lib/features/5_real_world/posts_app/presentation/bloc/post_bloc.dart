import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_mastery/features/5_real_world/posts_app/presentation/bloc/post_event.dart';
import 'package:flutter_mastery/features/5_real_world/posts_app/presentation/bloc/post_state.dart';

import '../../data/repo/post_api.dart';

/// BLoC for posts
///
/// This BLoC handles the business logic for the posts feature.
/// It processes events and emits new states.
class PostBloc extends Bloc<PostEvent, PostState> {
  /// Create a new post BLoC
  PostBloc() : super(const PostState()) {
    on<FetchPostsEvent>(_onFetchPosts);
    on<RefreshPostsEvent>(_onRefreshPosts);
  }

  /// Handle the fetch posts event
  ///
  /// Fetches posts from the API and emits a new state
  void _onFetchPosts(FetchPostsEvent event, Emitter<PostState> emit) async {
    if (state.hasReachedMax) return;

    emit(state.copyWith(status: PostStatus.loading));

    try {
      if (state.posts.isEmpty) {
        final posts = await PostsApi().getPosts();
        return posts.isEmpty
            ? emit(
                state.copyWith(status: PostStatus.success, hasReachedMax: true))
            : emit(state.copyWith(
                status: PostStatus.success,
                posts: posts,
                hasReachedMax: false));
      } else {
        final posts = await PostsApi().getPosts(start: state.posts.length);
        posts.isEmpty
            ? emit(state.copyWith(hasReachedMax: true))
            : emit(state.copyWith(
                status: PostStatus.success,
                posts: List.of(state.posts)..addAll(posts),
                hasReachedMax: false));
      }
    } catch (e) {
      emit(state.copyWith(
          status: PostStatus.error,
          errorMessege: 'Failed to fetch posts: ${e.toString()}'));
    }
  }

  /// Handle the refresh posts event
  ///
  /// Refreshes posts from the API and emits a new state
  void _onRefreshPosts(RefreshPostsEvent event, Emitter<PostState> emit) async {
    emit(state.copyWith(status: PostStatus.loading, posts: const []));

    try {
      final posts = await PostsApi().getPosts();
      return posts.isEmpty
          ? emit(
              state.copyWith(status: PostStatus.success, hasReachedMax: true))
          : emit(state.copyWith(
              status: PostStatus.success, posts: posts, hasReachedMax: false));
    } catch (e) {
      emit(state.copyWith(
          status: PostStatus.error,
          errorMessege: 'Failed to refresh posts: ${e.toString()}'));
    }
  }
}
