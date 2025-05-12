import 'package:equatable/equatable.dart';

import '../../data/model/post_model.dart';

enum PostStatus { loading, success, error }

class PostState extends Equatable {
  final PostStatus status;
  final List<PostModel> posts;
  final bool hasReachedMax;
  final String errorMessege;

  const PostState(
      {this.status = PostStatus.loading,
      this.posts = const <PostModel>[],
      this.hasReachedMax = false,
      this.errorMessege = ''});

  PostState copyWith(
      {PostStatus? status,
      List<PostModel>? posts,
      bool? hasReachedMax,
      String? errorMessege}) {
    return PostState(
        status: status ?? this.status,
        posts: posts ?? this.posts,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        errorMessege: errorMessege ?? this.errorMessege);
  }

  @override
  List<Object?> get props => [status, posts, hasReachedMax, errorMessege];
}
